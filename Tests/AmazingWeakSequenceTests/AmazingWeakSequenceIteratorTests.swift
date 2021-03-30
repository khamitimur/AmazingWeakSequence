import XCTest

@testable import AmazingWeakSequence

final class AmazingWeakSequenceIteratorTests: XCTestCase {
    
    // MARK: - Lifecycle
    
    override func setUpWithError() throws {
        try? super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try? super.tearDownWithError()
    }
    
    // MARK: - Tests
    
    func test_next() {
        // given
        let elements = [AmazingWeakSequenceElement(value: 1),
                        AmazingWeakSequenceElement(value: 2),
                        AmazingWeakSequenceElement(value: 3),
                        AmazingWeakSequenceElement(value: 4),
                        AmazingWeakSequenceElement(value: 5)]
        
        let amazingWeakSequenceIterator = AmazingWeakSequenceIterator(elements: elements)
        
        var elementsValuesSum: Int = 0
        
        // when
        while let element = amazingWeakSequenceIterator.next() {
            elementsValuesSum += element.value
        }
        
        // then
        XCTAssertEqual(elementsValuesSum, 15)
    }
}
