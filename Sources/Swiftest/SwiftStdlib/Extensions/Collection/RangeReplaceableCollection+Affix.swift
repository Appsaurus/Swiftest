//
//  RangeReplaceableCollection+Affix.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/17/18.
//

import Foundation

public extension RangeReplaceableCollection {
    
    // MARK: Appended copy
    
    @discardableResult
    func appended(with element: Element) -> Self {
        return self + [element]
    }
    
    @discardableResult
    func appended(with contents: [Element]) -> Self {
        return self + contents
    }
    
    // MARK: Prepend Mutations
    
    /// Swiftest: Insert an element at the beginning of array.
    ///
    ///        [2, 3, 4, 5].prepend(1) -> [1, 2, 3, 4, 5]
    ///        ["e", "l", "l", "o"].prepend("h") -> ["h", "e", "l", "l", "o"]
    ///
    /// - Parameter elements: elements to insert.
    @discardableResult
    mutating func prepend(_ elements: Element...) -> Self {
        return prepend(contentsOf: elements)
        
    }
    @discardableResult
    mutating func prepend<C>(contentsOf newElements: C) -> Self where C: Collection, C.Element == Element {
        insert(contentsOf: newElements, at: startIndex)
        return self
    }
    
    // MARK: Prepended copy
    
    /// Swiftest: Insert an element at the beginning of array.
    ///
    ///        [2, 3, 4, 5].prepend(1) -> [1, 2, 3, 4, 5]
    ///        ["e", "l", "l", "o"].prepend("h") -> ["h", "e", "l", "l", "o"]
    ///
    /// - Parameter elements: elements to insert.
    @discardableResult
    func prepended(with elements: Element...) -> Self {
        return prepended(withContentsOf: elements)
        
    }
    @discardableResult
    func prepended<C>(withContentsOf newElements: C) -> Self where C: Collection, C.Element == Element {
        var copy = self
        return copy.prepend(contentsOf: newElements)
    }
    
    // MARK: Replacement
    
    @discardableResult
    mutating func replaceLast(_ newValue: Element) -> Self {
        remove(at: lastIndex)
        append(newValue)
        return self
    }
    
    @discardableResult
    mutating func replaceFirst(_ newValue: Element) -> Self {
        remove(at: startIndex)
        prepend(newValue)
        return self
    }
}

public func + <E, C>(lhs: E, rhs: C) -> C where C: RangeReplaceableCollection, E == C.Element {
    return rhs.prepended(with: lhs)
}

public func + <E, C>(lhs: C, rhs: E) -> C where C: RangeReplaceableCollection, E == C.Element {
    return lhs.appended(with: rhs)
}


