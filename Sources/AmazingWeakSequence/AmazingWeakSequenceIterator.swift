import Foundation

public final class AmazingWeakSequenceIterator<Element>: IteratorProtocol {
    
    private var index = 0
    
    private let elements: [Element]
    
    public init(elements: [Element]) {
        self.elements = elements
    }
    
    // MARK: - IteratorProtocol
    
    public func next() -> Element? {
        defer { index += 1 }
        
        guard index < elements.count else {
            return nil
        }
        
        return elements[index]
    }
}
