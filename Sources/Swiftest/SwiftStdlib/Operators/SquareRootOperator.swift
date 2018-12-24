//
//  SquareRootOperator.swift
//  Swiftest
//
//  Created by Brian Strobach on 8/6/16.
//  Copyright © 2018 Appsaurus
//

#if canImport(CoreGraphics)
import CoreGraphics
#endif



prefix operator √

/// Swiftest: Square root of double.
///
/// - Parameter double: double value to find square root for.
/// - Returns: square root of given double.
public prefix func √ (double: Double) -> Double {
    // http://nshipster.com/swift-operators/
    return sqrt(double)
}

/// Swiftest: Square root of float.
///
/// - Parameter float: float value to find square root for
/// - Returns: square root of given float.
public prefix func √ (float: Float) -> Float {
    // http://nshipster.com/swift-operators/
    return sqrt(float)
}

/// Swiftest: Square root of integer.
///
/// - Parameter int: integer value to find square root for
/// - Returns: square root of given integer.
public prefix func √ (int: Int) -> Double {
    // http://nshipster.com/swift-operators/
    return sqrt(Double(int))
}
