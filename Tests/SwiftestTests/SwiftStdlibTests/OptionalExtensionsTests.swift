//
//  OptionalExtensionsTests.swift
//  Swiftest
//
//  Created by Brian Strobach on 3/3/17.
//  Copyright © 2018 Appsaurus
//

import XCTest
@testable import Swiftest

private enum OptionalTestError: Error {
    case optionalIsNil
}

final class OptionalExtensionsTests: XCTestCase {

    func testUnwrappedOrDefault() {
        var str: String?
        XCTAssertEqual(str.unwrapped(or: "swift"), "swift")

        str = "Swiftest"
        XCTAssertEqual(str.unwrapped(or: "swift"), "Swiftest")
    }

    func testUnwrappedOrError() {
        let null: String? = nil
        try XCTAssertThrowsError(null.unwrapped(or: OptionalTestError.optionalIsNil))

        let some: String? = "I exist"
        try XCTAssertNoThrow(some.unwrapped(or: OptionalTestError.optionalIsNil))
    }

    func testRunBlock() {
        var str: String?
        var didRun = false
        str.run { _ in
            didRun = true
        }
        XCTAssertFalse(didRun)
        str = "swift"
        str.run { item in
            didRun = true
            XCTAssert(didRun)
            XCTAssertEqual(item, "swift")
        }
    }

    func testOptionalAssignment() {
        let parameter1: String? = nil
        let parameter2: String? = "foo"

        let key1: String = "key1"
        let key2: String = "key2"

        var parameters = [String: String]()

        parameters[key1] =? parameter1
        parameters[key2] =? parameter2

        XCTAssert(parameters[key1] == nil)
        XCTAssertFalse(parameters[key1] != parameter1)
        XCTAssert(parameters[key2] == parameter2)
    }

    func testConditionalAssignment() {
        var text1: String?
        text1 ??= "newText1"
        XCTAssertEqual(text1, "newText1")

        var text2: String? = "text2"
        text2 ??= "newText2"
        XCTAssertEqual(text2, "text2")

        var text3: String?
        text3 ??= nil
        XCTAssertEqual(text3, nil)

        var text4: String? = "text4"
        text4 ??= nil
        XCTAssertEqual(text4, "text4")
    }

    func testIsNilOrEmpty() {
        let nilArray: [String]? = nil
        XCTAssertTrue(nilArray.isNilOrEmpty)

        let emptyArray: [String]? = []
        XCTAssertTrue(emptyArray.isNilOrEmpty)

        let intArray: [Int]? = [1]
        XCTAssertFalse(intArray.isNilOrEmpty)

        let optionalArray: [Int]? = [1]
        XCTAssertFalse(optionalArray.isNilOrEmpty)

        let nilString: String? = nil
        XCTAssert(nilString.isNilOrEmpty)

        let emptyString: String? = ""
        XCTAssert(emptyString.isNilOrEmpty)

        let string: String? = "hello World!"
        XCTAssertFalse(string.isNilOrEmpty)

    }

}
