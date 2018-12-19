//
//  BidirectionalCollectionExtensionsTests.swift
//  Swiftest
//
//  Created by Brian Strobach on 2018/10/13.
//  Copyright © 2018 Appsaurus
//

import XCTest
@testable import Swiftest

final class BidirectionalCollectionExtensionsTests: XCTestCase {

    func testOffsetSubscript() {
        let arr = [1, 2, 3, 4, 5]
        XCTAssertEqual(arr[offset: 0], 1)
        XCTAssertEqual(arr[offset: 4], 5)
        XCTAssertEqual(arr[offset: -2], 4)
    }

}
