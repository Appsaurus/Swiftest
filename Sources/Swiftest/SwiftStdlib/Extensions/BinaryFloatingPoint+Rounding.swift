//
//  BinaryFloatingPoint+Rounding.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/14/18.
//
#if canImport(Foundation)
import Foundation
// MARK: - Methods
public extension BinaryFloatingPoint {
    
    /// Swiftest: Returns a rounded value with the specified number of
    /// decimal places and rounding rule. If `numberOfDecimalPlaces` is negative,
    /// `0` will be used.
    ///
    ///     let num = 3.1415927
    ///     num.rounded(numberOfDecimalPlaces: 3, rule: .up) -> 3.142
    ///     num.rounded(numberOfDecimalPlaces: 3, rule: .down) -> 3.141
    ///     num.rounded(numberOfDecimalPlaces: 2, rule: .awayFromZero) -> 3.15
    ///     num.rounded(numberOfDecimalPlaces: 4, rule: .towardZero) -> 3.1415
    ///     num.rounded(numberOfDecimalPlaces: -1, rule: .toNearestOrEven) -> 3
    ///
    /// - Parameters:
    ///   - numberOfDecimalPlaces: The expected number of decimal places.
    ///   - rule: The rounding rule to use.
    /// - Returns: The rounded value.
    public func rounded(numberOfDecimalPlaces: Int, rule: FloatingPointRoundingRule = .toNearestOrAwayFromZero) -> Self {
        let factor = Self(pow(10.0, Double(max(0, numberOfDecimalPlaces))))
        return (self * factor).rounded(rule) / factor
    }
    
    public mutating func round(numberOfDecimalPlaces: Int, rule: FloatingPointRoundingRule = .toNearestOrAwayFromZero) {
        self = self.rounded(numberOfDecimalPlaces: numberOfDecimalPlaces, rule: rule)
    }
}
#endif
