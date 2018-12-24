//
//  BoolConvertible.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/14/18.
//

public protocol BoolConvertible: ExpressibleByBooleanLiteral {
    var bool: Bool { get }
}

public protocol OptionalBoolConvertible {
    var bool: Bool? { get }
}

extension String: OptionalBoolConvertible {
    /// Swiftest: Bool value from string (if applicable).
    ///
    ///        "1".bool -> true
    ///        "False".bool -> false
    ///        "Hello".bool = nil
    ///
    public var bool: Bool? {
        let selfLowercased = trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        switch selfLowercased {
        case "true", "1":
            return true
        case "false", "0":
            return false
        default:
            return nil
        }
    }
}
