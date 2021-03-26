import Foundation

/// Sequence that holds weak references to its elements.
public final class AmazingWeakSequence<Element>: Sequence {
    
    // MARK: - Private Properties
    
    /// Returns hash table for storing weak references.
    private let weakHashTable: NSHashTable<AnyObject>
    
    /// Returns serial dispatch queue to sync read and write operations.
    private let serialDispatchQueue: DispatchQueue
    
    // MARK: - Public Properties
    
    /// Returns the number of elements in sequence.
    public var count: Int {
        serialDispatchQueue.sync {
            weakHashTable.allObjects.count
        }
    }
    
    // MARK: - Initializers
    
    /// - Parameter dispatchQueueLabel: A string label to attach to the queue to uniquely identify it in debugging tools.
    public init(dispatchQueueLabel: String = "default.dispatchQueueLabel.title") {
        self.weakHashTable = NSHashTable<AnyObject>.weakObjects()
        self.serialDispatchQueue = DispatchQueue(label: dispatchQueueLabel)
    }
    
    // MARK: - Sequence
    
    public func makeIterator() -> AmazingWeakSequenceIterator<Element> {
        serialDispatchQueue.sync {
            AmazingWeakSequenceIterator(elements: weakHashTable.allObjects.compactMap { $0 as? Element })
        }
    }
    
    // MARK: - Public Methods
    
    /// Adds element to the sequence.
    public func add(_ element: Element) {
        serialDispatchQueue.sync {
            weakHashTable.add(element as AnyObject)
        }
    }
    
    /// Removes element from the sequence.
    public func remove(_ element: Element) {
        serialDispatchQueue.sync {
            weakHashTable.remove(element as AnyObject)
        }
    }
    
    /// Removes all elements in the sequence.
    public func removeAll() {
        serialDispatchQueue.sync {
            weakHashTable.removeAllObjects()
        }
    }
    
    /// Returns a value that indicates whether the sequence contains a given element.
    public func contains(_ element: Element) -> Bool {
        weakHashTable.contains(element as AnyObject)
    }
}
