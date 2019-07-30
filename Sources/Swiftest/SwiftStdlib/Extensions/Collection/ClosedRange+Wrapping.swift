//
//  ClosedRange+Wrapping.swift
//  Swiftest
//
//  Created by Brian Strobach on 7/30/19.
//

import Foundation

public extension ClosedRange where Element == Int {
    func wrapToBounds(_ value: Int) -> Int {
        return value.wrappedWithin(self)
    }
}
