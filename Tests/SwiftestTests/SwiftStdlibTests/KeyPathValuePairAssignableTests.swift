//
//  KeyPathValuePairAssignableTests.swift
//  SwiftestTests
//
//  Created by Brian Strobach on 12/27/18.
//

import XCTest
import SwiftTestUtils
@testable import Swiftest

private final class Object: KeyPathValuePairInitializable {
    public var id: Int?
    public var stringField: String = ""
    public var optionalStringField: String?
    public var intField: Int = 1
    public var doubleField: Double = 0.0
    public var booleanField: Bool = false
    //    public var dateField: Date = Date()
}

final class KeyPathValuePairAssignableTests: BaseTestCase {
    private let keyPathValuePairs: KeyPathValuePairs<Object> = [\.id => 1,
                                                                \.stringField => "String",
                                                                \.optionalStringField => "Optional",
                                                                \.intField => 2,
                                                                \.doubleField => 2.0,
                                                                \.booleanField => true]

    func testKeyValuePairAssignment() {
        let object = Object()
        object += keyPathValuePairs
        assertEquality(object: object)
    }

    func testKeyValuePairInitializer() {
        let object = Object(keyPathValuePairs)
        assertEquality(object: object)
    }

    private func assertEquality(object: Object) {
        XCTAssertEqual(object.id, 1)
        XCTAssertEqual(object.stringField, "String")
        XCTAssertEqual(object.optionalStringField, "Optional")
        XCTAssertEqual(object.intField, 2)
        XCTAssertEqual(object.doubleField, 2.0)
        XCTAssertEqual(object.booleanField, true)
    }

}
