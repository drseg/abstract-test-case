# Abstract Test Case

A single-file XCTest extension framework that allows easy creation of abstract test classes. Subclasses of `AbstractTestCase` may be entirely abstract, or may contain a mix of concrete and abstract test methods.

A test is considered to be abstract if the function name begins with `testAbstractly...`, though this is configurable by overriding `open var abstractTestIdentifier: String` in your `AbstractTestCase` subclass.

## Installation

As this is a single-file package, feel free to copy and paste if you prefer not to install the Swift Package. Otherwise, the Abstract Test Case package requires swift 5.5, and runs on macOS 10.13, iOS 11, tvOS 11, and watchOS 4 and later.

## Example

```swift
class AbstractTestCaseBaseTests: AbstractTestCase {
    override var abstractTestClass: XCTest.Type {
        AbstractTestCaseBaseTests.self
    }
    
    var shouldFail = true

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
```

This is actually the test included in the package - it simply shows that the test beginning with `testAbstractly` is only called on subclasses, whereas the test without `Abstractly` in the title is called on both the subclass and the superclass.

```swift
override var abstractTestClass: XCTest.Type {
    AbstractTestCaseBaseTests.self
}
```

This is the only required override, allowing your base class to tell `AbstractTestCase` that it is indeed the abstract base of the hierarchy, and that all other instances are therefore subclasses.

`AbstractTestCase` itself inherits directly from `XCTestCase`, overriding only the `perform(_ run: XCTestRun)` method. In all other respects it can be treated as if it were identical to `XCTestCase`.