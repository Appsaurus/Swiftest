//
//  Collection+Filtering.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/17/18.
//

import Foundation

public extension MutableCollection {
    /// Swiftest: Safely Swap values at index positions.
    ///
    ///        [1, 2, 3, 4, 5].safeSwap(from: 3, to: 0) -> [4, 2, 3, 1, 5]
    ///        ["h", "e", "l", "l", "o"].safeSwap(from: 1, to: 0) -> ["e", "h", "l", "l", "o"]
    ///
    /// - Parameters:
    ///   - index: index of first element.
    ///   - otherIndex: index of other element.
    mutating func safeSwap(from index: Index, to otherIndex: Index) {
        guard index != otherIndex else { return }
        guard startIndex..<endIndex ~= index else { return }
        guard startIndex..<endIndex ~= otherIndex else { return }
        swapAt(index, otherIndex)
    }
}
public extension RangeReplaceableCollection {
    
    /// Swiftest: Keep elements of Array while condition is true.
    ///
    ///        [0, 2, 4, 7].keep(while: {$0 % 2 == 0}) -> [0, 2, 4]
    ///
    /// - Parameter condition: condition to evaluate each element against.
    /// - Returns: self after applying provided condition.
    /// - Throws: provided condition exception.
    @discardableResult
    mutating func keep(while condition: ThrowingPredicate<Element>) rethrows -> Self {
        for (offset, element) in lazy.enumerated() where try !condition(element) {
            self = Self(self[startIndex..<index(startIndex, offsetBy: offset)])
            break
        }
        return self
    }
    
    /// Swiftest: Take element of Array while condition is true.
    ///
    ///        [0, 2, 4, 7, 6, 8].take(while: {$0 % 2 == 0}) -> [0, 2, 4]
    ///
    /// - Parameter condition: condition to evaluate each element against.
    /// - Returns: All elements up until condition evaluates to false.
    func take(while condition: ThrowingPredicate<Element>) rethrows -> Self {
        for (offset, element) in lazy.enumerated() where try !condition(element) {
            return Self(self[startIndex..<indexOffset(by: offset)])
        }
        return self
    }
    
    /// Swiftest: Skip elements of Array while condition is true.
    ///
    ///        [0, 2, 4, 7, 6, 8].skip(while: {$0 % 2 == 0}) -> [6, 8]
    ///
    /// - Parameter condition: condition to evaluate each element against.
    /// - Returns: All elements after the condition evaluates to false.
    func skip(while condition: (Element) throws-> Bool) rethrows -> Self {
        for (offset, element) in lazy.enumerated() where try !condition(element) {
            return Self(self[index(startIndex, offsetBy: offset)..<endIndex])
        }
        return Self()
        
    }
}

extension Collection {
    public func first<T: AnyObject>(_ type: T.Type) -> T? {
        return first(where: {$0 is T.Type}) as? T
    }

    public func firstSkipping(predicate: (Self.Element) throws -> Bool) rethrows -> Self.Element? {
        return try first(where: {try !predicate($0)})
    }

    public func filtered<T: AnyObject>(as type: T.Type) -> [T] {
        return map {$0 as? T}.removeNils()
    }
}

extension Collection where Element: Equatable {
    public func firstSkipping(element: Element) -> Element? {
        return firstSkipping(predicate: { $0 == element })
    }
}
