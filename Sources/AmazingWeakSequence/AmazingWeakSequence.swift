import Foundation

/// Sequence that holds weak references to its elements.
public final class AmazingWeakSequence<Element>: Sequence {
    
    // MARK: - Private Properties
    
    /// Returns hash table for storing weak references.
    private let weakHashTable: NSHashTable<AnyObject>
    
    /// Returns semaphore.
    private let semaphore: DispatchSemaphore
    
    // MARK: - Public Properties
    
    /// Returns the number of elements in sequence.
    public var count: Int {
        weakHashTable.allObjects.count
    }
    
    // MARK: - Initializers
    
    public init() {
        self.weakHashTable = NSHashTable<AnyObject>.weakObjects()
        self.semaphore = DispatchSemaphore(value: 1)
    }
    
    /// Initializes a new instance and adds initial elements to it.
    public convenience init(elements: [Element]) {
        self.init()
        
        self.add(elements)
    }
    
    // MARK: - Sequence
    
    public func makeIterator() -> AmazingWeakSequenceIterator<Element> {
        semaphore.wait {
            AmazingWeakSequenceIterator(elements: weakHashTable.allObjects.compactMap { $0 as? Element })
        }
    }
    
    // MARK: - Public Methods
    
    /// Adds element to the sequence.
    public func add(_ element: Element) {
        semaphore.wait {
            weakHashTable.add(element as AnyObject)
        }
    }
    
    /// Adds elements to the sequence.
    public func add(_ elements: [Element]) {
        semaphore.wait {
            for element in elements {
                weakHashTable.add(element as AnyObject)
            }
        }
    }
    
    /// Removes element from the sequence.
    public func remove(_ element: Element) {
        semaphore.wait {
            weakHashTable.remove(element as AnyObject)
        }
    }
    
    /// Removes elements from the sequence.
    public func remove(_ elements: [Element]) {
        semaphore.wait {
            for element in elements {
                weakHashTable.remove(element as AnyObject)
            }
        }
    }
    
    /// Removes all elements in the sequence.
    public func removeAll() {
        semaphore.wait {
            weakHashTable.removeAllObjects()
        }
    }
    
    /// Returns a value that indicates whether the sequence contains a given element.
    public func contains(_ element: Element) -> Bool {
        semaphore.wait {
            weakHashTable.contains(element as AnyObject)
        }
    }
}

private extension DispatchSemaphore {
    
    // MARK: - Methods
    
    /// Waits for execution block to complete and increments a semaphore.
    func wait<T>(_ executionBlock: () -> T) -> T {
        wait()
        
        defer { signal() }
        
        return executionBlock()
    }
}
