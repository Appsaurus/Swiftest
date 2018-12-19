//
//  URLRequestExtensionsTests.swift
//  Swiftest
//
//  Created by Brian Strobach on 9/6/17.
//  Copyright © 2018 Appsaurus
//

import XCTest
@testable import Swiftest

#if canImport(Foundation)
import Foundation

final class URLRequestExtensionsTests: XCTestCase {

    func testInitFromURLString() {
        let urlString = "https://www.w3schools.com/"
        let request1 = URLRequest(url: URL(string: urlString)!)
        let request2 = URLRequest(urlString: urlString)
        XCTAssertNotNil(request2)
        XCTAssertEqual(request1.url, request2!.url)

        let invalidURLString = "invalid url"
        XCTAssertNil(URLRequest(urlString: invalidURLString))
    }

}

#endif
