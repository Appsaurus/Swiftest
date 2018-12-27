//
//  KeyPathFunctionOperator.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/12/18.
//
//  From: https://gist.github.com/samdods/00d6a14a6430d824281822fdc2419672

/// Prefix operator to turn a KeyPath into a function
prefix operator ~

/// Allows a key path to be passed into mapping functions
///
///     e.g. people.map(\.name)
///
prefix func ~ <A, B>(_ keyPath: KeyPath<A, B>) -> (A) -> B {
    return { $0[keyPath: keyPath] }
}

/// Allows a key path to be passed into sorting functions
///
///     e.g. people.sorted(~\.name)
///
prefix func ~ <A, B>(_ keyPath: KeyPath<A, B>) -> (A, A) -> Bool where B: Comparable {
    return { $0[keyPath: keyPath] < $1[keyPath: keyPath] }
}

/// Allows a Boolean-type key path to be passed into filter-like functions,
/// `filter`, `first(where:)`, `drop(while:)`, etc.
///
///     e.g. people.first(where: ~\.address.street.isEmpty)
///
prefix func ~ <A>(_ keyPath: KeyPath<A, Bool>) -> (A) -> Bool {
    return { $0[keyPath: keyPath] }
}
