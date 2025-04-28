//
//  Pairs.swift
//  Swiftest
//
//  Created by Brian Strobach on 1/14/19.
//
//

open class Pair<T>: MixedPair<T, T> {
    public convenience init(_ duplicatedItem: T) {
        self.init(duplicatedItem, duplicatedItem)
    }
}

open class MixedPair<F, S> {
    public var values: (first: F, second: S)

    public required init(_ first: F, _ second: S) {
        self.values = (first, second)
    }
}

public struct PairStruct<T> {
    public typealias F = T
    public typealias S = T

    public var values: (first: T, second: T)

    public init(_ first: T, _ second: T) {
        self.values = (first, second)
    }

    public init(_ duplicatedItem: T) {
        self.init(duplicatedItem, duplicatedItem)
    }
}

public struct MixedPairStruct<F, S> {
    public var values: (first: F, second: S)

    public init(_ first: F, _ second: S) {
        self.values = (first, second)
    }
}

public typealias TuplePair<T> = (first: T, second: T)
public typealias MixedTuplePair<F, S> = (first: F, second: S)

public typealias TupleTrio<T> = (first: T, second: T, third: T)
public typealias MixedTupleTrio<F, S, T> = (first: F, second: S, third: T)
