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
        }
    }
    
    func testOtherwiseRunsInAll() {
        XCTAssertTrue(true)
    }
}

class AbstractTestCaseSubTests: AbstractTestCaseBaseTests {
    override func setUp() {
        shouldFail = false
    }
}
