//
//  IntConvertible.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/14/18.
//

public protocol IntConvertible {
    var int: Int { get }
}

extension Double: IntConvertible {
    public var int: Int {
        return Int(self)
    }
}

extension Float: IntConvertible {
    public var int: Int {
        return Int(self)
    }
}

extension Bool: IntConvertible {

    /// Swiftest: Return 1 if true, or 0 if false.
    ///
    ///        false.int -> 0
    ///        true.int -> 1
    ///
    public var int: Int {
        return self ? 1 : 0
    }
}

public protocol OptionalIntConvertible {
    var int: Int? { get }
}

extension String: OptionalIntConvertible {

    /// Swiftest: Integer value from string (if applicable).
    ///
    ///        "101".int -> 101
    ///
    public var int: Int? {
        return Int(self)
    }
}

extension Character: OptionalIntConvertible {
    
    /// Swiftest: Integer from character (if applicable).
    ///
    ///        Character("1").int -> 1
    ///        Character("A").int -> nil
    ///
    public var int: Int? {
        return Int(String(self))
    }
}
