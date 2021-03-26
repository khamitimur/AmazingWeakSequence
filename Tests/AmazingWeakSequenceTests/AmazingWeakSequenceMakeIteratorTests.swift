import XCTest

@testable import AmazingWeakSequence

final class AmazingWeakSequenceMakeIteratorTests: XCTestCase {
    
    // MARK: - Lifecycle
    
    override func setUpWithError() throws {
        try? super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try? super.tearDownWithError()
    }

    // MARK: - Tests
    
    func test_amazingWeakSequence_makeIterator() {
        let element1 = AmazingWeakSequenceElementMock(value: 1)
        let element2 = AmazingWeakSequenceElementMock(value: 2)
        let element3 = AmazingWeakSequenceElementMock(value: 3)
        let element4 = AmazingWeakSequenceElementMock(value: 4)
        let element5 = AmazingWeakSequenceElementMock(value: 5)
        
        let amazingWeakSequence = AmazingWeakSequence<AmazingWeakSequenceElementMock<Int>>()
        
        amazingWeakSequence.add(element1)
        amazingWeakSequence.add(element2)
        amazingWeakSequence.add(element3)
        amazingWeakSequence.add(element4)
        amazingWeakSequence.add(element5)
        
        amazingWeakSequence.add(AmazingWeakSequenceElementMock(value: 10))
        
        var elementsValuesSum: Int = 0
        
        for element in amazingWeakSequence {
            elementsValuesSum += element.value
        }
        
        XCTAssertEqual(elementsValuesSum, 15)
    }
}
