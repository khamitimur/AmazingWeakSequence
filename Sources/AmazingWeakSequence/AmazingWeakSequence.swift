import Foundation

public final class AmazingWeakSequence<Element>: Sequence {
    
    // MARK: - Private Properties
    
    private let weakHashTable: NSHashTable<AnyObject>
    
    private let serialDispatchQueue: DispatchQueue
    
    // MARK: - Public Properties
    
    public var count: Int {
        serialDispatchQueue.sync {
            weakHashTable.allObjects.count
        }
    }
    
    // MARK: - Initializers
    
    public init(dispatchQueueLabel: String = "defaultDispatchQueueLabel") {
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
    
    public func add(_ element: Element) {
        serialDispatchQueue.sync {
            weakHashTable.add(element as AnyObject)
        }
    }
    
    public func remove(_ element: Element) {
        serialDispatchQueue.sync {
            weakHashTable.remove(element as AnyObject)
        }
    }
    
    public func removeAll() {
        weakHashTable.removeAllObjects()
    }
    
    public func contains(_ element: Element) -> Bool {
        weakHashTable.contains(element as AnyObject)
    }
}
