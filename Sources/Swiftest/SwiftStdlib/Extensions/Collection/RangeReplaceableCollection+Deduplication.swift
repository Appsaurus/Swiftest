//
//  RangeReplaceableCollection+Deduplication.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/17/18.
//

import Foundation

public extension RangeReplaceableCollection where Element: AnyObject {
    
    @discardableResult
    public mutating func removeDuplicateReferences() -> Self {
        self = withoutDuplicateReferences
        return self
    }
    
    public var withoutDuplicateReferences: Self {
        return reduce(into: Self(), { (accumulated, element) in
            if !accumulated.contains(where: {$0 === element}) {
                accumulated.append(element)
            }
        })
    }
}

public extension RangeReplaceableCollection where Element: Equatable {
    
    /// Swiftest: Remove all duplicate elements from Array.
    ///
    ///        [1, 2, 2, 3, 4, 5].removeDuplicates() -> [1, 2, 3, 4, 5]
    ///        ["h", "e", "l", "l", "o"]. removeDuplicates() -> ["h", "e", "l", "o"]
    ///
    @discardableResult
    public mutating func removeDuplicates() -> Self {
        self = withoutDuplicates
        return self
    }
    
    /// Swiftest: Return array with all duplicate elements removed.
    ///
    ///     [1, 1, 2, 2, 3, 3, 3, 4, 5].withoutDuplicates() -> [1, 2, 3, 4, 5])
    ///     ["h", "e", "l", "l", "o"].withoutDuplicates() -> ["h", "e", "l", "o"])
    ///
    /// - Returns: an array of unique elements.
    ///
    public var withoutDuplicates: Self {
        // Thanks to https://github.com/sairamkotha for improving the method
        return reduce(into: Self()) {
            if !$0.contains($1) {
                $0.append($1)
            }
        }
    }
}
