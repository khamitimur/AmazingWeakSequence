import XCTest

@testable import AmazingWeakSequence

final class AmazingWeakSequenceTests: XCTestCase {
    
    // MARK: - Lifecycle
    
    override func setUpWithError() throws {
        try? super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try? super.tearDownWithError()
    }
    
    // MARK: - Tests
    
    func test_convenienceInitWithElements() {
        // given
        let elements = [AmazingWeakSequenceElement(value: 1),
                        AmazingWeakSequenceElement(value: 2),
                        AmazingWeakSequenceElement(value: 3),
                        AmazingWeakSequenceElement(value: 4),
                        AmazingWeakSequenceElement(value: 5)]
        
        // when
        let amazingWeakSequence = AmazingWeakSequence(elements: elements)
        
        // then
        for element in elements {
            XCTAssertTrue(amazingWeakSequence.contains(element))
        }
    }
    
    func test_addElement() {
        // given
        let element = AmazingWeakSequenceElement(value: 1)
        
        let amazingWeakSequence = AmazingWeakSequence<AmazingWeakSequenceElement<Int>>()
        
        // when
        amazingWeakSequence.add(element)
        
        // then
        XCTAssertTrue(amazingWeakSequence.contains(element))
    }
    
    func test_addElements() {
        // given
        let elements = [AmazingWeakSequenceElement(value: 1),
                        AmazingWeakSequenceElement(value: 2),
                        AmazingWeakSequenceElement(value: 3),
                        AmazingWeakSequenceElement(value: 4),
                        AmazingWeakSequenceElement(value: 5)]
        
        let amazingWeakSequence = AmazingWeakSequence<AmazingWeakSequenceElement<Int>>()
        
        // when
        amazingWeakSequence.add(elements)
        
        // then
        for element in elements {
            XCTAssertTrue(amazingWeakSequence.contains(element))
        }
    }
    
    func test_removeElement() {
        // given
        let elements = [AmazingWeakSequenceElement(value: 1),
                        AmazingWeakSequenceElement(value: 2),
                        AmazingWeakSequenceElement(value: 3),
                        AmazingWeakSequenceElement(value: 4),
                        AmazingWeakSequenceElement(value: 5)]
        
        let amazingWeakSequence = AmazingWeakSequence(elements: elements)
        
        // when
        amazingWeakSequence.remove(elements[0])
        
        // then
        XCTAssertFalse(amazingWeakSequence.contains(elements[0]))
    }
    
    func test_removeElements() {
        // given
        let elements = [AmazingWeakSequenceElement(value: 1),
                        AmazingWeakSequenceElement(value: 2),
                        AmazingWeakSequenceElement(value: 3),
                        AmazingWeakSequenceElement(value: 4),
                        AmazingWeakSequenceElement(value: 5)]
        
        let amazingWeakSequence = AmazingWeakSequence(elements: elements)
        
        let elementsToRemove = [elements[0],
                                elements[1],
                                elements[4]]
        
        // when
        amazingWeakSequence.remove(elementsToRemove)
        
        // then
        for elementToRemove in elementsToRemove {
            XCTAssertFalse(amazingWeakSequence.contains(elementToRemove))
        }
    }
    
    func test_removeAll() {
        // given
        let elements = [AmazingWeakSequenceElement(value: 1),
                        AmazingWeakSequenceElement(value: 2),
                        AmazingWeakSequenceElement(value: 3),
                        AmazingWeakSequenceElement(value: 4),
                        AmazingWeakSequenceElement(value: 5)]
        
        let amazingWeakSequence = AmazingWeakSequence(elements: elements)
        
        // when
        amazingWeakSequence.removeAll()
        
        // then
        for element in elements {
            XCTAssertFalse(amazingWeakSequence.contains(element))
        }
    }
    
    func test_contains() {
        // given
        let elements = [AmazingWeakSequenceElement(value: 1)]
        let otherElements = [AmazingWeakSequenceElement(value: 11)]
        
        let amazingWeakSequence = AmazingWeakSequence(elements: elements)
        
        // when
        let containsElement = amazingWeakSequence.contains(elements[0])
        let containsOtherElement = amazingWeakSequence.contains(otherElements[0])
        
        // then
        XCTAssertTrue(containsElement)
        XCTAssertFalse(containsOtherElement)
    }
    
    func test_count() {
        // given
        let elements = [AmazingWeakSequenceElement(value: 1),
                        AmazingWeakSequenceElement(value: 2),
                        AmazingWeakSequenceElement(value: 5)]
        
        let amazingWeakSequence = AmazingWeakSequence(elements: elements)
        
        // when
        let elementsCount = amazingWeakSequence.count
        
        XCTAssertEqual(elementsCount, 3)
    }
    
    func test_makeIterator() {
        // given
        let elements = [AmazingWeakSequenceElement(value: 1),
                        AmazingWeakSequenceElement(value: 2),
                        AmazingWeakSequenceElement(value: 3),
                        AmazingWeakSequenceElement(value: 4),
                        AmazingWeakSequenceElement(value: 5)]
        
        let amazingWeakSequence = AmazingWeakSequence(elements: elements)
        
        var elementsValuesSum: Int = 0
        
        // when
        let amazingWeakSequenceIterator = amazingWeakSequence.makeIterator()
        
        while let element = amazingWeakSequenceIterator.next() {
            elementsValuesSum += element.value
        }
        
        // then
        XCTAssertEqual(elementsValuesSum, 15)
    }
}
