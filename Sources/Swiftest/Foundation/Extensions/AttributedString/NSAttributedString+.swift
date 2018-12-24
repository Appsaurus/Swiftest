//
//  NSAttributedStringExtensions.swift
//  Swiftest
//
//  Created by Brian Strobach on 26/11/2016.
//  Copyright © 2018 Appsaurus
//

#if canImport(Foundation)
import Foundation

// MARK: - Properties
public extension NSAttributedString {
    public var fullRange: NSRange {
        return NSRange(location: 0, length: self.length)
    }
    
    public var mutable: NSMutableAttributedString {
        return NSMutableAttributedString(attributedString: self)
    }
}

public extension NSAttributedString {

    /// Swiftest: Dictionary of the attributes applied across the whole string
    public var attributes: [NSAttributedString.Key: Any] {
        guard self.length > 0 else { return [:] }
        return attributes(at: 0, effectiveRange: nil)
    }

}

// MARK: - Methods
public extension NSAttributedString {

    /// Swiftest: Applies given attributes to the new instance of NSAttributedString initialized with self object
    ///
    /// - Parameter attributes: Dictionary of attributes
    /// - Returns: NSAttributedString with applied attributes
    public func applying(attributes: [NSAttributedString.Key: Any]) -> NSAttributedString {
        let copy = NSMutableAttributedString(attributedString: self)
        let range = (string as NSString).range(of: string)
        copy.addAttributes(attributes, range: range)

        return copy
    }

    /// Swiftest: Apply attributes to substrings matching a regular expression
    ///
    /// - Parameters:
    ///   - attributes: Dictionary of attributes
    ///   - pattern: a regular expression to target
    /// - Returns: An NSAttributedString with attributes applied to substrings matching the pattern
    public func applying(attributes: [NSAttributedString.Key: Any], toRangesMatching pattern: String) -> NSAttributedString {
        guard let pattern = try? NSRegularExpression(pattern: pattern, options: []) else { return self }

        let matches = pattern.matches(in: string, options: [], range: NSRange(0..<length))
        let result = NSMutableAttributedString(attributedString: self)

        for match in matches {
            result.addAttributes(attributes, range: match.range)
        }

        return result
    }

    /// Swiftest: Apply attributes to occurrences of a given string
    ///
    /// - Parameters:
    ///   - attributes: Dictionary of attributes
    ///   - target: a subsequence string for the attributes to be applied to
    /// - Returns: An NSAttributedString with attributes applied on the target string
    public func applying<T: StringProtocol>(attributes: [NSAttributedString.Key: Any], toOccurrencesOf target: T) -> NSAttributedString {
        let pattern = "\\Q\(target)\\E"

        return applying(attributes: attributes, toRangesMatching: pattern)
    }

}

// MARK: - Operators
public extension NSAttributedString {

    /// Swiftest: Add a NSAttributedString to another NSAttributedString.
    ///
    /// - Parameters:
    ///   - lhs: NSAttributedString to add to.
    ///   - rhs: NSAttributedString to add.
    public static func += (lhs: inout NSAttributedString, rhs: NSAttributedString) {
        let string = NSMutableAttributedString(attributedString: lhs)
        string.append(rhs)
        lhs = string
    }

    /// Swiftest: Add a NSAttributedString to another NSAttributedString and return a new NSAttributedString instance.
    ///
    /// - Parameters:
    ///   - lhs: NSAttributedString to add.
    ///   - rhs: NSAttributedString to add.
    /// - Returns: New instance with added NSAttributedString.
    public static func + (lhs: NSAttributedString, rhs: NSAttributedString) -> NSAttributedString {
        let string = NSMutableAttributedString(attributedString: lhs)
        string.append(rhs)
        return NSAttributedString(attributedString: string)
    }

    /// Swiftest: Add a NSAttributedString to another NSAttributedString.
    ///
    /// - Parameters:
    ///   - lhs: NSAttributedString to add to.
    ///   - rhs: String to add.
    public static func += (lhs: inout NSAttributedString, rhs: String) {
        lhs += NSAttributedString(string: rhs)
    }

    /// Swiftest: Add a NSAttributedString to another NSAttributedString and return a new NSAttributedString instance.
    ///
    /// - Parameters:
    ///   - lhs: NSAttributedString to add.
    ///   - rhs: String to add.
    /// - Returns: New instance with added NSAttributedString.
    public static func + (lhs: NSAttributedString, rhs: String) -> NSAttributedString {
        return lhs + NSAttributedString(string: rhs)
    }

}
#endif
