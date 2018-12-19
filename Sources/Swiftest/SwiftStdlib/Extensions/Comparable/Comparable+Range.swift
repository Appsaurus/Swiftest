//
//  Comparable+Range.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/18/18.
//

extension Comparable{
    /// Swiftest: Returns true if value is in the provided range.
    ///
    ///    1.isBetween(5...7) // false
    ///    7.isBetween(6...12) // true
    ///    date.isBetween(date1...date2)
    ///    "c".isBetween(a...d) // true
    ///    0.32.isBetween(0.31...0.33) // true
    ///
    /// - parameter min: Minimum comparable value.
    /// - parameter max: Maximum comparable value.
    ///
    /// - returns: `true` if value is between `min` and `max`, `false` otherwise.
    public func isBetween(_ range: ClosedRange<Self>) -> Bool {
        return range ~= self
    }
}
