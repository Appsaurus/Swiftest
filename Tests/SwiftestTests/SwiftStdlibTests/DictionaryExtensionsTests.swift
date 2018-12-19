//
//  DictionaryExtensionsTests.swift
//  Swiftest
//
//  Created by Brian Strobach on 8/27/16.
//  Copyright © 2018 Appsaurus
//

import XCTest
@testable import Swiftest

final class DictionaryExtensionsTests: XCTestCase {

    var testDict: [String: Any] = ["testKey": "testValue", "testArrayKey": [1, 2, 3, 4, 5]]

    func testHasKey() {
        XCTAssert(testDict.has(key: "testKey"))
        XCTAssertFalse(testDict.has(key: "anotherKey"))
    }

    func testRemoveAll() {
        var dict: [String: String] = ["key1": "value1", "key2": "value2", "key3": "value3"]
        dict.removeAll(keys: ["key1", "key2"])
        XCTAssertTrue(dict.keys.contains("key3"))
        XCTAssertFalse(dict.keys.contains("key1"))
        XCTAssertFalse(dict.keys.contains("key2"))
    }

    func testKeysForValue() {
        let dict = ["key1": "value1", "key2": "value1", "key3": "value2"]
        let result = dict.keys(forValue: "value1")
        XCTAssertTrue(result.contains("key1"))
        XCTAssertTrue(result.contains("key2"))
        XCTAssertFalse(result.contains("key3"))
    }

    func testLowercaseAllKeys() {
        var dict = ["tEstKeY": "value"]
        dict.lowercaseAllKeys()
        XCTAssertEqual(dict, ["testkey": "value"])
    }

    func testSubscriptKeypath() {
        var json = ["key": ["key1": ["key2": "value"]]]

        XCTAssertEqual(json[path: []] as? String, nil)
        XCTAssertEqual(json[path: ["key", "key1"]] as? [String: String], ["key2": "value"])
        XCTAssertEqual(json[path: ["key", "key1", "key2"]] as? String, "value")
        json[path: ["key", "key1", "key2"]] = "newValue"
        XCTAssertEqual(json[path: ["key", "key1", "key2"]] as? String, "newValue")
    }

    func testOperatorPlus() {
        let dict: [String: String] = ["key1": "value1"]
        let dict2: [String: String] = ["key2": "value2"]
        let result = dict + dict2
        XCTAssertTrue(result.keys.contains("key1"))
        XCTAssertTrue(result.keys.contains("key2"))
    }

    func testOperatorMinus() {
        let dict: [String: String] = ["key1": "value1", "key2": "value2", "key3": "value3"]
        let result = dict-["key1", "key2"]
        XCTAssertTrue(result.keys.contains("key3"))
        XCTAssertFalse(result.keys.contains("key1"))
        XCTAssertFalse(result.keys.contains("key2"))
    }

    func testOperatorPlusEqual() {
        var dict: [String: String] = ["key1": "value1"]
        let dict2: [String: String] = ["key2": "value2"]
        dict += dict2
        XCTAssertTrue(dict.keys.contains("key1"))
        XCTAssertTrue(dict.keys.contains("key2"))
    }

    func testOperatorRemoveKeys() {
        var dict: [String: String] = ["key1": "value1", "key2": "value2", "key3": "value3"]
        dict-=["key1", "key2"]
        XCTAssertTrue(dict.keys.contains("key3"))
        XCTAssertFalse(dict.keys.contains("key1"))
        XCTAssertFalse(dict.keys.contains("key2"))
    }

    func testMapKeysAndValues() {
        let intToString = [0: "0", 1: "1", 2: "2", 3: "3", 4: "4", 5: "5", 6: "6", 7: "7", 8: "8", 9: "9"]

        let stringToInt: [String: Int] = intToString.mapKeysAndValues { (key, value) in
            return (String(describing: key), Int(value)!)
        }

        XCTAssertEqual(stringToInt, ["0": 0, "1": 1, "2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8, "9": 9])
    }

    func testCompactMapKeysAndValues() {
        // swiftlint:disable:next nesting
        enum IntWord: String {
            case zero
            case one
            case two
        }

        let strings = [
            0: "zero",
            1: "one",
            2: "two",
            3: "three"
        ]
        let words: [String: IntWord] = strings.compactMapKeysAndValues { (key, value) in
            guard let word = IntWord(rawValue: value) else { return nil }
            return (String(describing: key), word)
        }

        XCTAssertEqual(words, ["0": .zero, "1": .one, "2": .two])
    }

}
