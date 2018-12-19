//
//  Character+.swift
//  Swiftest
//
//  Created by Brian Strobach on 8/8/16.
//  Copyright © 2018 Appsaurus
//

#if canImport(Foundation)
import Foundation
#endif

// MARK: - Properties
public extension Character {

    /// Swiftest: Check if character is emoji.
    ///
    ///        Character("😀").isEmoji -> true
    ///
    public var isEmoji: Bool {
        return String(self).containsEmoji
    }

    /// Swiftest: Check if character is number.
    ///
    ///        Character("1").isNumber -> true
    ///        Character("a").isNumber -> false
    ///
    public var isNumber: Bool {
        return Int(String(self)) != nil
    }

    /// Swiftest: Check if character is a letter.
    ///
    ///        Character("4").isLetter -> false
    ///        Character("a").isLetter -> true
    ///
    public var isLetter: Bool {
        return String(self).rangeOfCharacter(from: .letters, options: .numeric, range: nil) != nil
    }

    /// Swiftest: Check if character is lowercased.
    ///
    ///        Character("a").isLowercased -> true
    ///        Character("A").isLowercased -> false
    ///
    public var isLowercased: Bool {
        return String(self) == String(self).lowercased()
    }

    /// Swiftest: Check if character is uppercased.
    ///
    ///        Character("a").isUppercased -> false
    ///        Character("A").isUppercased -> true
    ///
    public var isUppercased: Bool {
        return String(self) == String(self).uppercased()
    }

    /// Swiftest: Check if character is white space.
    ///
    ///        Character(" ").isWhiteSpace -> true
    ///        Character("A").isWhiteSpace -> false
    ///
    public var isWhiteSpace: Bool {
        return String(self) == " "
    }

   

    /// Swiftest: Return the character lowercased.
    ///
    ///        Character("A").lowercased -> Character("a")
    ///
    public var lowercased: Character {
        return String(self).lowercased().first!
    }

    /// Swiftest: Return the character uppercased.
    ///
    ///        Character("a").uppercased -> Character("A")
    ///
    public var uppercased: Character {
        return String(self).uppercased().first!
    }

}



// MARK: - Operators
public extension Character {

    /// Swiftest: Repeat character multiple times.
    ///
    ///        Character("-") * 10 -> "----------"
    ///
    /// - Parameters:
    ///   - lhs: character to repeat.
    ///   - rhs: number of times to repeat character.
    /// - Returns: string with character repeated n times.
    public static func * (lhs: Character, rhs: Int) -> String {
        guard rhs > 0 else { return "" }
        return String(repeating: String(lhs), count: rhs)
    }

    /// Swiftest: Repeat character multiple times.
    ///
    ///        10 * Character("-") -> "----------"
    ///
    /// - Parameters:
    ///   - lhs: number of times to repeat character.
    ///   - rhs: character to repeat.
    /// - Returns: string with character repeated n times.
    public static func * (lhs: Int, rhs: Character) -> String {
        guard lhs > 0 else { return "" }
        return String(repeating: String(rhs), count: lhs)
    }

}
