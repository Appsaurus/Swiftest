//
//  RangeReplaceableCollection+Partitioning.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/17/18.
//

extension Collection {
    public func split(middleElementToLeft: Bool = true) -> (left: Self.SubSequence, right: Self.SubSequence) {
        let splitIndex = middleElementToLeft ? midIndex : midIndexRightTiebreaker
        let leftSplit = self[startIndex...splitIndex]
        let rightSplit = self[index(splitIndex, offsetBy: 1)...lastIndex]
        return (left: leftSplit, right: rightSplit)
    }
}

extension RangeReplaceableCollection {
    /// Swiftest: Separates collections into 2 collections based on a predicate.
    ///
    ///     [0, 1, 2, 3, 4, 5].divided { $0 % 2 == 0 } -> ( [0, 2, 4], [1, 3, 5] )
    ///
    /// - Parameter condition: condition to evaluate each element against.
    /// - Returns: Two collections, the first containing the elements for which the specified condition evaluates to true, the second containing the rest.
    public func divided(by condition: (Element) throws -> Bool) rethrows -> (matching: Self, nonMatching: Self) {
        //Inspired by: http://ruby-doc.org/core-2.5.0/Enumerable.html#method-i-partition
        var matching = Self()
        var nonMatching = Self()
        for element in self {
            try condition(element) ? matching.append(element) : nonMatching.append(element)
        }
        return (matching, nonMatching)
    }
    /// Swiftest: Separates a collections into 2 collections based on a predicate. Alias for `divided(by condition:)`
    ///
    ///     [0, 1, 2, 3, 4, 5].partition { $0 % 2 == 0 } -> ( [0, 2, 4], [1, 3, 5] )
    ///
    /// - Parameter condition: condition to evaluate each element against.
    /// - Returns: Two collections, the first containing the elements for which the specified condition evaluates to true, the second containing the rest.
    public func partitioned(by condition: (Element) throws -> Bool) rethrows -> (matching: Self, nonMatching: Self) {
        return try divided(by: condition)
    }
}
