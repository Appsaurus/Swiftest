//
//  Comparable+Clamped.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/18/18.
//

public extension Comparable {
    
    /// Swiftest: Returns value limited within the provided range.
    ///
    ///     1.clamped(to: 3...8) // 3
    ///     4.clamped(to: 3...7) // 4
    ///     "c".clamped(to: "e"..."g") // "e"
    ///     0.32.clamped(to: 0.1...0.29) // 0.29
    ///
    /// - parameter min: Lower bound to limit the value to.
    /// - parameter max: Upper bound to limit the value to.
    ///
    /// - returns: A value limited to the range between `min` and `max`.
    public func clamped(to range: ClosedRange<Self>) -> Self {
        return max(range.lowerBound, min(self, range.upperBound))
    }
    
    public func clamped(_ lower: Self, _ upper: Self) -> Self {
        return clamped(to: lower...upper)
    }
    
    @discardableResult
    public mutating func clamp(to range: ClosedRange<Self>) -> Self {
        self = clamped(to: range)
        return self
    }
    
    @discardableResult
    public mutating func clamp(_ lower: Self, _ upper: Self) -> Self {
        self = clamped(lower, upper)
        return self
    }
    
}
