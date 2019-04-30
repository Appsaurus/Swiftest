//
//  DoubleExtensionsTests.swift
//  Swiftest
//
//  Created by Brian Strobach on 8/27/16.
//  Copyright © 2018 Appsaurus
//

import XCTest
@testable import Swiftest

final class DoubleExtensionsTests: XCTestCase {

    func testInt() {
        XCTAssertEqual(Double(-1).int, -1)
        XCTAssertEqual(Double(2).int, 2)
        XCTAssertEqual(Double(4.3).int, 4)
    }

    func testFloat() {
        XCTAssertEqual(Double(-1).float, Float(-1))
        XCTAssertEqual(Double(2).float, Float(2))
        XCTAssertEqual(Double(4.3).float, Float(4.3))
    }
    func testCGFloat() {
        #if !os(Linux) && canImport(CoreGraphics)
        XCTAssertEqual(Double(4.3).cgFloat, CGFloat(4.3))
        #endif
    }
    
    func testOperators() {
        XCTAssertEqual((Double(5.0) ** Double(2.0)), Double(25.0))
        #if !os(Linux)
        XCTAssertEqual((√Double(25.0)), Double(5.0))
        #endif
    }

}
