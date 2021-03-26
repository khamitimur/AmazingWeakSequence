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
        let amazingWeakSequence = AmazingWeakSequence<AmazingWeakSequenceObjectMock<Int>>()
        
        let objectMock1 = AmazingWeakSequenceObjectMock(value: 1)
        let objectMock2 = AmazingWeakSequenceObjectMock(value: 2)
        let objectMock3 = AmazingWeakSequenceObjectMock(value: 3)
        let objectMock4 = AmazingWeakSequenceObjectMock(value: 4)
        let objectMock5 = AmazingWeakSequenceObjectMock(value: 5)
        
        amazingWeakSequence.add(objectMock1)
        amazingWeakSequence.add(objectMock2)
        amazingWeakSequence.add(objectMock3)
        amazingWeakSequence.add(objectMock4)
        amazingWeakSequence.add(objectMock5)
        
        amazingWeakSequence.add(AmazingWeakSequenceObjectMock(value: 10))
        
        var elementsValuesSum: Int = 0
        
        for element in amazingWeakSequence {
            elementsValuesSum += element.value
        }
        
        XCTAssertEqual(elementsValuesSum, 15)
    }
}
