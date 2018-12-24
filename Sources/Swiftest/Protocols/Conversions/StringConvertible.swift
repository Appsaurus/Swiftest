//
//  StringConvertible.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/14/18.
//

public protocol StringConvertible {
    var string: String { get }
}

public protocol StringInitializable {
    init(_ string: String)
}

public protocol OptionalStringInitializable {
    init?(_ string: String)
}

extension String: StringConvertible, StringInitializable {
    public var string: String {
        return self
    }
}

extension Character: StringConvertible, StringInitializable {

    /// Swiftest: String from character.
    ///
    ///        Character("a").string -> "a"
    ///
    public var string: String {
        return String(self)
    }
}

public extension Numeric {
    public var string: String {
        return String(describing: self)
    }
}

extension Int: StringConvertible, OptionalStringInitializable {}
extension Double: StringConvertible, OptionalStringInitializable {}
extension Float: StringConvertible, OptionalStringInitializable {}

extension Bool: StringConvertible, OptionalStringInitializable {
    /// Swiftest: Return "true" if true, or "false" if false.
    ///
    ///        false.string -> "false"
    ///        true.string -> "true"
    ///
    public var string: String {
        return description
    }
}
