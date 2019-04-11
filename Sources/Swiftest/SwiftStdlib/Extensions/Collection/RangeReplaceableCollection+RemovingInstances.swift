//
//  RangeReplaceableCollection+RemovingInstances.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/14/18.
//

import Foundation

public extension RangeReplaceableCollection where Element: AnyObject {
    
    /// Swiftest: Remove all references of an object using the identity operator.
    ///
    ///    let object1 = Object()
    ///    let object2 = Object()
    ///    let object1Ref = object1
    ///    var arr: [Object] = [object1, object2, object1Ref]
    ///    arr.remove(object: object1) -> [object2]
    ///
    /// - Parameter object: reference of object to remove.
    /// - Returns: self after removing all references to given object.
    @discardableResult
    mutating func remove(object: Element) -> Self {
        removeAll(where: { $0 === object })
        return self
    }
    
    /// Swiftest: Remove all references of an object using the identity operator.
    ///
    ///    let object1 = Object()
    ///    let object2 = Object()
    ///    let object3 = Object()
    ///    let object1Ref = object1
    ///    var arr: [Object] = [object1, object2, object3, object1Ref]
    ///    arr.remove(objects: object1, object2) -> [object3]
    ///
    /// - Parameter objects: reference of objects to remove.
    /// - Returns: self after removing all references to given objects.
    @discardableResult
    mutating func remove(objects: Element...) -> Self {
        return remove(objects: objects)
    }
    
    /// Swiftest: Remove all references of an object using the identity operator.
    ///
    ///    let object1 = Object()
    ///    let object2 = Object()
    ///    let object3 = Object()
    ///    let object1Ref = object1
    ///    var arr: [Object] = [object1, object2, object3, object1Ref]
    ///    arr.remove(objects: [object1, object2]) -> [object3]
    ///
    /// - Parameter objects: array of references of objects to remove.
    /// - Returns: self after removing all references to given objects.
    @discardableResult
    mutating func remove(objects: [Element]) -> Self {
        guard !objects.isEmpty else { return self }
        removeAll(where: { object in
            objects.contains(where: {$0 === object})
        })
        return self
    }
}

// MARK: - Methods (Equatable)
public extension RangeReplaceableCollection where Element: Equatable {
    
    /// Swiftest: Remove all elements equal to a value from an array.
    ///
    ///        [1, 2, 2, 3, 4, 5].remove(value: 2) -> [1, 3, 4, 5]
    ///        ["h", "e", "l", "l", "o"].remove(value: "l") -> ["h", "e", "o"]
    ///
    /// - Parameter value: value to remove.
    /// - Returns: self after removing all values equal to a value.
    @discardableResult
    mutating func remove(value: Element) -> Self {
        removeAll(where: { $0 == value })
        return self
    }
    
    /// Swiftest: Remove all elements equal to values from an array.
    ///
    ///        [1, 2, 2, 3, 4, 5].remove(values: 2, 5) -> [1, 3, 4]
    ///        ["h", "e", "l", "l", "o"].remove(values: "l", "h") -> ["e", "o"]
    ///
    /// - Parameter values: values to remove.
    /// - Returns: self after removing all values equal to given values.
    @discardableResult
    mutating func remove(values: Element...) -> Self {
        return remove(values: values)
    }
    
    /// Swiftest: Remove all elements equal to values from an array.
    ///
    ///        [1, 2, 2, 3, 4, 5].remove(values: [2, 5]) -> [1, 3, 4]
    ///        ["h", "e", "l", "l", "o"].remove(values: ["l", "h"]) -> ["e", "o"]
    ///
    /// - Parameter values: values to remove.
    /// - Returns: self after removing all values equal to given values.
    @discardableResult
    mutating func remove(values: [Element]) -> Self {
        guard !values.isEmpty else { return self }
        removeAll(where: { value in
            values.contains(where: {$0 == value})
        })
        return self
    }
}

extension RangeReplaceableCollection {
    /// Swiftest: Removes the first element of the collection which satisfies the given predicate.
    ///
    ///        [1, 2, 2, 3, 4, 2, 5].removeFirst { $0 % 2 == 0 } -> [1, 2, 3, 4, 2, 5]
    ///        ["h", "e", "l", "l", "o"].removeFirst { $0 == "e" } -> ["h", "l", "l", "o"]
    ///
    /// - Parameter predicate: A closure that takes an element as its argument and returns a Boolean value that indicates whether the passed element represents a match.
    /// - Returns: The first element for which predicate returns true, after removing it. If no elements in the collection satisfy the given predicate, returns `nil`.
    @discardableResult
    public mutating func removeFirst(where predicate: ThrowingPredicate<Element>) rethrows -> Element? {
        guard let index = try firstIndex(where: predicate) else { return nil }
        return remove(at: index)
    }
    
    #if canImport(Foundation)
    /// Swiftest: Remove a random value from the collection.
    @discardableResult public mutating func removeRandomElement() -> Element? {
        guard let randomIndex = indices.randomElement() else { return nil }
        return remove(at: randomIndex)
    }
    #endif
}
