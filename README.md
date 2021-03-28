# AmazingWeakSequence

`AmazingWeakSequence` is a sequence that holds weak references to its elements.

## The problem

In every Swift developer career comes a point when he or she needs to collect weakly referenced objects. But doing so will lead to creating strong references to this objects which is clearly defeats any purpose of having weak references in the first place.

## What can you do about it?

First and widely accepted option is to create a wrapper:
```swift
class WeakWrapper<T: AnyObject> {
    
    weak var value : T?
    
    init (value: T) {
        self.value = value
    }
}
```

And then use it like so:
```swift
var weakReferences: [SomeWeakWrapper<UIViewController>] = []

// ...

weakReferences.append(WeakWrapper(value: viewController))

// ...

for weakReference in weakReferences {
    guard let value = weakReference.value else { return }
    // ...
}
```

One problem that is obvious right away: you need to keep track of wrappers with `nil` values in them. At some point you'll need to clear up your collection or you'll risk to hold a huge number ob objects that are useless.

## Is there a better way?

Yes, there is. It's [`NSHashTable`](https://developer.apple.com/documentation/foundation/nshashtable). Take a look at convenience constructor [`weakObjects()`](https://developer.apple.com/documentation/foundation/nshashtable/1412241-weakobjects):
```
Returns a new hash table for storing weak references to its contents.
```

`AmazingWeakSequence` takes advantage of `NSHashTable` and adds a sprinkle of thread safety on top.

## Usage

```swift
import AmazingWeakSequence

protocol ServiceDelegate: AnyObject {
    // ...
}

class Service {
    let delegates = AmazingWeakSequence<ServiceDelegate>()
    
    // ...
    
    func addDelegate(_ delegate: ServiceDelegate) {
        delegates.add(delegate)
    }
    
    func removeDelegate(_ delegate: ServiceDelegate) {
        delegates.remove(delegate)
    }
    
    func notifyDelegates() {
        for delegate in delegates {
            // ...
        }
    }
}
```

## Requirements

- macOS 10.14+
- iOS 11.0+
- tvOS 11.0+
- watchOS 4.0+
- Xcode 11+
- Swift 5.0+

## Installation
### CocoaPods
To integrate `AmazingWeakSequence` into your Xcode project using [CocoaPods](https://cocoapods.org/), specify it in your `Podfile`:
```ruby
pod 'AmazingWeakSequence', '~> 1.0.0'
```

### Swift Package Manager

To integrate `AmazingWeakSequence` into your Xcode project using [Swift Package Manager](https://swift.org/package-manager/), specify it as dependency in your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/khamitimur/AmazingWeakSequence.git", .upToNextMinor(from: "1.0.0"))
]
```

### Git Submodules
To integrate `AmazingWeakSequence` into your workspace using `git` [submodules](https://git-scm.com/docs/git-submodule), open `Terminal` in your top-level project directory and run the following command:
```bash
git submodule add https://github.com/khamitimur/AmazingWeakSequence.git
```

If your project is not initialized as a `git` repository run the following command first:
```bash
git init
```

You'll find new `AmazingWeakSequence` folder. Open it and drag and drop `AmazingWeakSequence.xcodeproj` into your project in the project navigator in `Xcode`. Or into the project navigator root if you're working with `Workspace`.

Select your project and add `AmazingWeakSequence.framework` under `General -> Frameworks and Libraries`.

### Manually
Drag and drop `AmazingWeakSequence.xcodeproj` into your project in the project navigator in `Xcode`. Or into the project navigator root if you're working with `Workspace`.

Select your project and add `AmazingWeakSequence.framework` under `General -> Frameworks and Libraries`.

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgments

* Inspired by Stack Overflow [answer](https://stackoverflow.com/a/27108747/1022906) by [Thierry](https://stackoverflow.com/users/2449044/thierry).
