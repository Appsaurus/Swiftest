//
//  String+Lookup.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/18/18.
//

import Foundation

public extension String {
    
    /// Swiftest: Sliced string from a start index with length.
    ///
    ///        "Hello World".slicing(from: 6, length: 5) -> "World"
    ///
    /// - Parameters:
    ///   - i: string index the slicing should start from.
    ///   - length: amount of characters to be sliced after given index.
    /// - Returns: sliced substring of length number of characters (if applicable) (example: "Hello World".slicing(from: 6, length: 5) -> "World")
    func slicing(from i: Int, length: Int) -> String? {
        guard length >= 0, i >= 0, i < count  else { return nil }
        guard i.advanced(by: length) <= count else {
            return self[safe: i..<count]
        }
        guard length > 0 else { return "" }
        return self[safe: i..<i.advanced(by: length)]
    }
    
    /// Swiftest: Slice given string from a start index with length (if applicable).
    ///
    ///        var str = "Hello World"
    ///        str.slice(from: 6, length: 5)
    ///        print(str) // prints "World"
    ///
    /// - Parameters:
    ///   - i: string index the slicing should start from.
    ///   - length: amount of characters to be sliced after given index.
    mutating func slice(from i: Int, length: Int) {
        if let str = slicing(from: i, length: length) {
            self = String(str)
        }
    }
    
    /// Swiftest: Slice given string from a start index to an end index (if applicable).
    ///
    ///        var str = "Hello World"
    ///        str.slice(from: 6, to: 11)
    ///        print(str) // prints "World"
    ///
    /// - Parameters:
    ///   - start: string index the slicing should start from.
    ///   - end: string index the slicing should end at.
    mutating func slice(from start: Int, to end: Int) {
        guard end >= start else { return }
        if let str = self[safe: start..<end] {
            self = str
        }
    }
    
    /// Swiftest: Slice given string from a start index (if applicable).
    ///
    ///        var str = "Hello World"
    ///        str.slice(at: 6)
    ///        print(str) // prints "World"
    ///
    /// - Parameter i: string index the slicing should start from.
    mutating func slice(at i: Int) {
        guard i < count else { return }
        if let str = self[safe: i..<count] {
            self = str
        }
    }

    func slice(from: String, to: String) -> String? {
        return (range(of: from)?.upperBound).flatMap { substringFrom in
            (range(of: to, range: substringFrom..<endIndex)?.lowerBound).map { substringTo in
                String(self[substringFrom..<substringTo])
            }
        }
    }
}



public extension String {
    func split(substring: String, lastOccurrence: Bool = true) -> (left: String, right: String)? {
        guard let range = self.range(of: substring) else { return nil }
        let left = String(self[..<range.lowerBound])
        let right = String(self[range.upperBound...])
        return (left, right)
    }
    func split(delimiterToken: String, lastOccurrence: Bool = true) -> (left: String, right: String)? {
        let parts = self.split(separator: " ").map { String($0).trimmed}
        guard let index = lastOccurrence ? parts.lastIndex(of: delimiterToken) : parts.firstIndex(of: delimiterToken) else { return nil }
        let left = parts[..<index].joined(separator: " ")
        guard index != parts.lastIndex else { return nil }
        let right = parts[(index + 1)...].joined(separator: " ")
        return (left, right)
    }

}
