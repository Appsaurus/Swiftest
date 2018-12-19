//
//  BoolExtensionsTests.swift
//  Swiftest
//
//  Created by Brian Strobach on 20/01/2017.
//  Copyright © 2018 Appsaurus
//

import XCTest
@testable import Swiftest

final class BoolExtensionsTests: XCTestCase {

    func testInt() {
        XCTAssertEqual(true.int, 1)
        XCTAssertEqual(false.int, 0)
    }

    func testString() {
        XCTAssertEqual(true.string, "true")
        XCTAssertEqual(false.string, "false")
    }

}
