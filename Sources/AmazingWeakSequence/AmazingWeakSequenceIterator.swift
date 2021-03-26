import Foundation

public final class AmazingWeakSequenceIterator<Element>: IteratorProtocol {
    
    // MARK: - Private Properties
    
    /// Returns index of current element.
    private var currentIndex = 0
    
    /// Returns elements.
    private let elements: [Element]
    
    // MARK: - Initializers
    
    public init(elements: [Element]) {
        self.elements = elements
    }
    
    // MARK: - IteratorProtocol
    
    public func next() -> Element? {
        defer { currentIndex += 1 }
        
        guard currentIndex < elements.count else {
            return nil
        }
        
        return elements[currentIndex]
    }
}
