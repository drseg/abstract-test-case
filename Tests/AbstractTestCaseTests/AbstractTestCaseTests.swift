import XCTest
@testable import AbstractTestCase

class AbstractTestCaseBaseTests: AbstractTestCase {
    var shouldFail = true
    
    override var abstractTestClass: XCTest.Type {
        AbstractTestCaseBaseTests.self
    }
    
    func testAbstractlyOnlyRunsInSubclasses() {
        if shouldFail {
            XCTFail()
        } else {
            XCTAssert(true)
        }
    }
    
    func testOtherwiseRunsInAll() {
        XCTAssert(true)
    }
}

class AbstractTestCaseSubTests: AbstractTestCaseBaseTests {
    override func setUp() {
        shouldFail = false
    }
}
