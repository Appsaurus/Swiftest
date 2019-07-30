//
//  ClosedRangeExtensionTests.swift
//  Swiftest
//
//  Created by Brian Strobach on 7/30/19.
//

import XCTest
@testable import Swiftest

final class ClosedRangeExtensionsTests: XCTestCase {

    func testWrap() throws {
        let range = 1...7
        XCTAssert(range.wrapToBounds(-9) == 5)
        XCTAssert(range.wrapToBounds(-8) == 6)
        XCTAssert(range.wrapToBounds(-7) == 7)
        XCTAssert(range.wrapToBounds(-6) == 1)
        XCTAssert(range.wrapToBounds(-5) == 2)
        XCTAssert(range.wrapToBounds(-4) == 3)
        XCTAssert(range.wrapToBounds(-3) == 4)
        XCTAssert(range.wrapToBounds(-2) == 5)
        XCTAssert(range.wrapToBounds(-1) == 6)
        XCTAssert(range.wrapToBounds(0) == 7)
        XCTAssert(range.wrapToBounds(1) == 1)
        XCTAssert(range.wrapToBounds(2) == 2)
        XCTAssert(range.wrapToBounds(3) == 3)
        XCTAssert(range.wrapToBounds(4) == 4)
        XCTAssert(range.wrapToBounds(5) == 5)
        XCTAssert(range.wrapToBounds(6) == 6)
        XCTAssert(range.wrapToBounds(7) == 7)
        XCTAssert(range.wrapToBounds(8) == 1)
        XCTAssert(range.wrapToBounds(9) == 2)
    }
}
