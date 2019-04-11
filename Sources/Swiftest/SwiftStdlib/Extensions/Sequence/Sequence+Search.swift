//
//  SequenceExtensions.swift
//  Swiftest
//
//  Created by Brian Strobach on 1/13/17.
//  Copyright © 2018 Appsaurus
//

import Foundation

public extension Sequence {
    
    /// Swiftest: Get last element that satisfies a conditon.
    ///
    ///        [2, 2, 4, 7].last(where: {$0 % 2 == 0}) -> 4
    ///
    /// - Parameter condition: condition to evaluate each element against.
    /// - Returns: the last element in the array matching the specified condition. (optional)
    func last(where condition: ThrowingPredicate<Element>) rethrows -> Element? {
        for element in reversed() {
            if try condition(element) { return element }
        }
        return nil
    }
    
    /// Swiftest: Get the only element based on a condition.
    ///
    ///     [].single(where: {_ in true}) -> nil
    ///     [4].single(where: {_ in true}) -> 4
    ///     [1, 4, 7].single(where: {$0 % 2 == 0}) -> 4
    ///     [2, 2, 4, 7].single(where: {$0 % 2 == 0}) -> nil
    ///
    /// - Parameter condition: condition to evaluate each element against.
    /// - Returns: The only element in the array matching the specified condition. If there are more matching elements, nil is returned. (optional)
    func single(where condition: (ThrowingPredicate<Element>)) rethrows -> Element? {
        var singleElement: Element?
        for element in self where try condition(element) {
            guard singleElement == nil else {
                singleElement = nil
                break
            }
            singleElement = element
        }
        return singleElement
    }
    
    /// Swiftest: Filter elements based on a rejection condition.
    ///
    ///        [2, 2, 4, 7].reject(where: {$0 % 2 == 0}) -> [7]
    ///
    /// - Parameter condition: to evaluate the exclusion of an element from the array.
    /// - Returns: the array with rejected values filtered from it.
    func reject(where condition: ThrowingPredicate<Element>) rethrows -> [Element] {
        return try filter { return try !condition($0) }
    }
    
    // Alias for `filter(_ isIncluded: ThrowingPredicate<Element>) rethrows -> [Element]` to be more semantic
    func find(where condition: ThrowingPredicate<Element>) rethrows -> [Element] {
        return try filter { return try condition($0) }
    }
}

public extension Sequence where Element: Hashable {
    
    /// Swiftest: Getting the duplicated elements in a sequence.
    ///
    ///     [1, 1, 2, 2, 3, 3, 3, 4, 5].duplicates.sorted() -> [1, 2, 3])
    ///     ["h", "e", "l", "l", "o"].duplicates.sorted() -> ["l"])
    ///
    /// - Returns: An array of duplicated elements.
    ///
    var duplicates: [Element] {
        var set = Set<Element>()
        var duplicates = Set<Element>()
        forEach {
            if !set.insert($0).inserted {
                duplicates.insert($0)
            }
        }
        return Array(duplicates)
    }
}
