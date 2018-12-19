//
//  ErrorTransformOperator.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/12/18.
//

import Foundation

infix operator ~>

public func ~><T>(expression: @autoclosure () throws -> T,
                  errorTransform: (Error) -> Error) throws -> T {
    do {
        return try expression()
    } catch {
        throw errorTransform(error)
    }
}
