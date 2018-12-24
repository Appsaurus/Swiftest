//
//  Sequence+BooleanTests.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/12/18.
//

extension Sequence where Element: Equatable {
    
    /// Swiftest: Check if all elements in collection match a conditon.
    ///
    ///        [2, 2, 4].all(match: {$0 % 2 == 0}) -> true
    ///        [1,2, 2, 4].all(match: {$0 % 2 == 0}) -> false
    ///
    /// - Parameter condition: condition to evaluate each element against.
    /// - Returns: true when all elements in the array match the specified condition.
    public func all(match condition: (Element) throws -> Bool) rethrows -> Bool {
        return try !contains { try !condition($0) }
    }
    
    /// Swiftest: Check if no elements in collection match a conditon.
    ///
    ///        [2, 2, 4].none(match: {$0 % 2 == 0}) -> false
    ///        [1, 3, 5, 7].none(match: {$0 % 2 == 0}) -> true
    ///
    /// - Parameter condition: condition to evaluate each element against.
    /// - Returns: true when no elements in the array match the specified condition.
    public func none(match condition: (Element) throws -> Bool) rethrows -> Bool {
        return try !contains { try condition($0) }
    }
    
    /// Swiftest: Check if any element in collection match a conditon.
    ///
    ///        [2, 2, 4].any(match: {$0 % 2 == 0}) -> false
    ///        [1, 3, 5, 7].any(match: {$0 % 2 == 0}) -> true
    ///
    /// - Parameter condition: condition to evaluate each element against.
    /// - Returns: true when no elements in the array match the specified condition.
    public func any(match condition: (Element) throws -> Bool) rethrows -> Bool {
        return try contains { try condition($0) }
    }
    
    public func contains(any elements: [Element]) -> Bool {
        for element in elements {
            if contains(element) { return true }
        }
        return false
    }
    
    //Variadic overload for `contains(any elements: [Element]) -> Bool`
    public func contains(any elements: Element...) -> Bool {
        return contains(any: elements)
    }
    
    /// Swiftest: Check if array contains an array of elements.
    ///
    ///        [1, 2, 3, 4, 5].contains([1, 2]) -> true
    ///        [1.2, 2.3, 4.5, 3.4, 4.5].contains([2, 6]) -> false
    ///        ["h", "e", "l", "l", "o"].contains(["l", "o"]) -> true
    ///
    /// - Parameter elements: array of elements to check.
    /// - Returns: true if array contains all given items.
    public func contains(all elements: [Element]) -> Bool {
        guard !elements.isEmpty else { return true }
        for element in elements {
            if !contains(element) {
                return false
            }
        }
        return true
    }
    //Variadic overload for `contains(_ elements: [Element]) -> Bool`
    public func contains(all elements: Element...) -> Bool {
        return contains(all: elements)
    }
}

public extension Sequence where Element: Hashable {
    
    /// Swiftest: Check whether a sequence contains duplicates.
    ///
    /// - Returns: true if the receiver contains duplicates.
    public var containsDuplicates: Bool {
        var set = Set<Element>()
        for element in self {
            if !set.insert(element).inserted {
                return true
            }
        }
        return false
    }
}
