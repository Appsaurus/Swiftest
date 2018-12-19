//
//  Collection+ReverseLookup.swift
//  Swiftest
//
//  Created by Brian Strobach on 7/13/18.
//  Copyright © 2018 Appsaurus
//

extension Collection{
    /// Swiftest: Get all indices where condition is met.
    ///
    ///     [1, 7, 1, 2, 4, 1, 8].indices(where: { $0 == 1 }) -> [0, 2, 5]
    ///
    /// - Parameter condition: condition to evaluate each element against.
    /// - Returns: all indices where the specified condition evaluates to true. (optional)
    public func indices(where condition: (Element) throws -> Bool) rethrows -> [Index]? {
        var matchingIndices: [Index] = []
        for index in indices where try condition(self[index]){
            matchingIndices.append(index)
        }
        return matchingIndices.isEmpty ? nil : matchingIndices
    }
}
extension Collection where Element: Equatable {

    /// Swiftest: All indices of specified item.
    ///
    ///        [1, 2, 2, 3, 4, 2, 5].indices(of 2) -> [1, 2, 5]
    ///        [1.2, 2.3, 4.5, 3.4, 4.5].indices(of 2.3) -> [1]
    ///        ["h", "e", "l", "l", "o"].indices(of "l") -> [2, 3]
    ///
    /// - Parameter item: item to check.
    /// - Returns: an array with all indices of the given item.
    public func indices(of value: Element) -> [Index]? {
        return indices(where: { (element: Element) -> Bool in
            return (element == value)
        })
    }

}
