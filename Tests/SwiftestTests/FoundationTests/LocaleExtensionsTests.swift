//
//  LocaleExtensionsTests.swift
//  Swiftest
//
//  Created by Brian Strobach on 4/19/17.
//  Copyright © 2018 Appsaurus
//

import XCTest
@testable import Swiftest

#if canImport(Foundation)
import Foundation

final class LocaleExtensionsTests: XCTestCase {

    func testPosix() {
        let test: Locale = .posix
        XCTAssertEqual(test.identifier, "en_US_POSIX")
    }

}

#endif
