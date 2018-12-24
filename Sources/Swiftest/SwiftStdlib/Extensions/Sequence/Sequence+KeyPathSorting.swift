//
//  Sequence+KeyPathSorting.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/12/18.
//

import Foundation

public typealias Comparator<Value: Comparable> = (Value, Value) -> Bool
public typealias OptionalComparator<Value: Comparable> = (Value?, Value?) -> Bool

public enum SortOrder {
    case ascending
    case descending
    
    public static var `default`: SortOrder = .ascending
    
    public func comparator<Value>() -> Comparator<Value> {
        switch self {
        case .ascending:
            return (<)
        case .descending:
            return (>)
        }
    }
}

public enum OptionalSortOrder {
    case ascendingNilsLast
    case ascendingNilsFirst
    case descendingNilsLast
    case descendingNilsFirst
    
    public static var `default`: OptionalSortOrder = .ascendingNilsLast
    
    private func _comparator<Value>() -> Comparator<Value> {
        switch self {
        case .ascendingNilsLast, .ascendingNilsFirst:
            return (<)
        case .descendingNilsLast, .descendingNilsFirst:
            return (>)
        }
    }
    
    private var nilsLast: Bool {
        switch self {
        case .ascendingNilsLast, .descendingNilsLast:
            return true
        case .ascendingNilsFirst, .descendingNilsFirst:
            return false
        }
    }
    
    public func comparator<Value>() -> OptionalComparator<Value> {
        return { (lhs: Value?, rhs: Value?) -> Bool in
            return self.compare(lhs, rhs)
        }
    }
    
    func compare<Value: Comparable>(_ lhs: Value?,
                                    _ rhs: Value?) -> Bool {
        switch (lhs, rhs) {
        case let (lhs?, rhs?):
            return _comparator()(lhs, rhs)
        case (nil, _?):
            return !nilsLast
        default:
            return nilsLast
        }
    }
}
extension Sequence {
    
    /// Swiftest: Returns a sorted array based on a keypath.
    ///
    /// - Parameters:
    ///   - keyPath: Key path to sort. The key path type must be Comparable.
    ///   - order: Order to sort (default: .ascending)
    /// - Returns: Array sorted based on key path.
    public func sorted<Value: Comparable>(by keyPath: KeyPath<Element, Value>,
                                          _ order: SortOrder = .default) -> [Element] {
        return sorted(by: keyPath, order.comparator())
    }
    
    /// Swiftest: Returns a sorted array based on a keypath.
    ///
    /// - Parameters:
    ///   - keyPath: Key path to sort. The key path type must be Comparable.
    ///   - comparator: A predicate to determine sort order (true = 1st argument comes before 2nd, otherwise false)
    /// - Returns: Array sorted based on key path and comparator.
    public func sorted<Value: Comparable>(by keyPath: KeyPath<Element, Value>,
                                          _ comparator: Comparator<Value>) -> [Element] {
        return sorted {
            comparator($0[keyPath: keyPath], $1[keyPath: keyPath])
        }
    }
    
    /// Swiftest: Returns a sorted array based on a keypath with optional value.
    ///
    /// - Parameters:
    ///   - keyPath: Key path to sort. The key path type must be Comparable.
    ///   - order: Order to sort (default: .ascending, nils last)
    /// - Returns: Array sorted based on key path.
    public func sorted<Value: Comparable>(by keyPath: KeyPath<Element, Value?>,
                                          _ order: OptionalSortOrder = .default) -> [Element] {
        return sorted(by: keyPath, order.comparator())
    }

    /// Swiftest: Returns a sorted array based on a keypath.
    ///
    /// - Parameters:
    ///   - keyPath: Key path to sort. The key path type must be Comparable.
    ///   - comparator: A predicate to determine sort order (true = 1st argument comes before 2nd, otherwise false)
    /// - Returns: Array sorted based on key path and comparator.
    public func sorted<Value: Comparable>(by keyPath: KeyPath<Element, Value?>,
                                          _ comparator: OptionalComparator<Value>) -> [Element] {
        return sorted {
            comparator($0[keyPath: keyPath], $1[keyPath: keyPath])
        }
    }
}

extension MutableCollection where Self: RandomAccessCollection {
    
    /// Sort the collection based on a keypath.
    ///
    /// - Parameters:
    ///   - keyPath: Key path to sort, must be Comparable.
    ///   - order: Order to sort (default: .ascending).
    /// - Returns: self after sorting.
    @discardableResult
    mutating public func sort<Value: Comparable>(by keyPath: KeyPath<Element, Value>,
                                                 _ order: SortOrder = .default) -> Self {
        sort(by: keyPath, order.comparator())
        return self
    }
    
    /// Sort the collection based on a keypath.
    ///
    /// - Parameters:
    ///   - keyPath: Key path to sort, must be Comparable.
    ///   - comparator: A predicate to determine sort order (true = 1st argument comes before 2nd, otherwise false)
    /// - Returns: self after sorting.
    @discardableResult
    mutating public func sort<Value: Comparable>(by keyPath: KeyPath<Element, Value>,
                                                 _ comparator: Comparator<Value>) -> Self {
        sort {
            comparator($0[keyPath: keyPath], $1[keyPath: keyPath])
        }
        return self
    }

    /// Sort the collection based on a keypath with optional value.
    ///
    /// - Parameters:
    ///   - keyPath: Key path to sort, must be Comparable.
    ///   - order: Order to sort (default: .ascending).
    ///   - nilsLast: Whether nils come first or last in sort order (default: true)
    /// - Returns: self after sorting.
    
    @discardableResult
    mutating public func sort<Value: Comparable>(by keyPath: KeyPath<Element, Value?>,
                                                 _ order: OptionalSortOrder = .default) -> Self {
        sort(by: keyPath, order.comparator())
        return self
    }
    
    /// Sort the collection based on a keypath with optional value.
    ///
    /// - Parameters:
    ///   - keyPath: Key path to sort, must be Comparable.
    ///   - comparator: A predicate to determine sort order (true = 1st argument comes before 2nd, otherwise false)
    /// - Returns: self after sorting.
    @discardableResult
    mutating public func sort<Value: Comparable>(by keyPath: KeyPath<Element, Value?>,
                                                 _ comparator: OptionalComparator<Value>) -> Self {
        var copy = self
        copy.sort {
            comparator($0[keyPath: keyPath], $1[keyPath: keyPath])
        }
        self = copy
        return self
    }
    
}
