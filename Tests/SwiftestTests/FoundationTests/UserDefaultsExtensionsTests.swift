//
//  UserDefaultsExtensionsTests.swift
//  Swiftest
//
//  Created by Brian Strobach on 9/6/17.
//  Copyright © 2018 Appsaurus
//

import XCTest
@testable import Swiftest



import Foundation

final class UserDefaultsExtensionsTests: XCTestCase {

    private struct TestObject: Codable {
        var itemId: Int
    }

    func testSubscript() {
        #if !os(Linux) && canImport(Foundation)
        let key = "testKey"
        UserDefaults.standard.set(true, forKey: key)
        XCTAssertNotNil(UserDefaults.standard[key])
        XCTAssert(UserDefaults.standard[key] as? Bool ?? false)

        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard[key] = false
        XCTAssertNotNil(UserDefaults.standard[key])
        XCTAssertFalse(UserDefaults.standard[key] as? Bool ?? false)
        #endif
    }

    func testFloat() {
        #if !os(Linux) && canImport(Foundation)
        let key = "floatTestKey"
        let number: Float = 10.0
        UserDefaults.standard.set(number, forKey: key)
        XCTAssertNotNil(UserDefaults.standard.float(forKey: key))
        XCTAssertEqual(UserDefaults.standard.float(forKey: key)!, number)
        #endif
    }

    func testDate() {
        #if !os(Linux) && canImport(Foundation)
        let key = "dateTestKey"
        let date: Date = Date()
        UserDefaults.standard.set(date, forKey: key)
        XCTAssertNotNil(UserDefaults.standard.date(forKey: key))
        XCTAssertEqual(UserDefaults.standard.date(forKey: key)!, date)
        #endif
    }

    func testGetCodableObject() {
        #if !os(Linux) && canImport(Foundation)
        let key = "codableTestKey"
        let codable: TestObject = TestObject(itemId: 1)
        UserDefaults.standard.set(object: codable, forKey: key)
        let retrievedCodable = UserDefaults.standard.object(TestObject.self, with: key)
        XCTAssertNotNil(retrievedCodable)
        #endif
    }

    func testSetCodableObject() {
        #if !os(Linux) && canImport(Foundation)
        let key = "codableTestKey"
        let codable: TestObject = TestObject(itemId: 1)
        UserDefaults.standard.set(object: codable, forKey: key)
        let retrievedCodable = UserDefaults.standard.object(TestObject.self, with: key)
        XCTAssertNotNil(retrievedCodable)
        #endif
    }

}
