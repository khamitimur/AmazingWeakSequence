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
    
    func test_amazingWeakSequenceIterator_next() {
        let elements = [AmazingWeakSequenceElementMock(value: 1),
                        AmazingWeakSequenceElementMock(value: 2),
                        AmazingWeakSequenceElementMock(value: 3),
                        AmazingWeakSequenceElementMock(value: 4),
                        AmazingWeakSequenceElementMock(value: 5)]
        
        let amazingWeakSequenceIterator = AmazingWeakSequenceIterator(elements: elements)
        
        var elementsValuesSum: Int = 0
        
        while let element = amazingWeakSequenceIterator.next() {
            elementsValuesSum += element.value
        }
        
        XCTAssertEqual(elementsValuesSum, 15)
    }
}
