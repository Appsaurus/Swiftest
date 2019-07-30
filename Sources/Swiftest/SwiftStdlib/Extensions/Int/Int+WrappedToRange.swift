//
//  Int+WrappedToRange.swift
//  Swiftest
//
//  Created by Brian Strobach on 7/30/19.
//

import Foundation

public extension Int {
    func wrappedWithin(_ range: ClosedRange<Int>) -> Int {
        let min = range.lowerBound
        let max = range.upperBound
        let rangeSize = max - min + 1
        guard self > 0 else {
            return max - (min - self).wrappedWithin(range) + 1
        }
        let value = self % rangeSize
        return value == 0 ? max : value
    }
}
