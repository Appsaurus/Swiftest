//
//  TransformErrorOperator.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/29/18.
//
//  Based on: https://www.swiftbysundell.com/posts/custom-operators-in-swift

/// Infix operator to transform an error into another error, useful for unifying Error APIs.
///
/// - Parameters:
///   - expression: Throwing expression
///   - errorTransform: The function to transform the error, or the error itself.
/// - Returns: The original return value of the expression.
/// - Throws: The new error resulting from errorTransform.
public func ~> <T>(expression: @autoclosure () throws -> T,
                   errorTransform: (Error) -> Error) throws -> T {
    do {
        return try expression()
    } catch {
        throw errorTransform(error)
    }
}
