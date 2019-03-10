//
//  Pairs.swift
//  Swiftest
//
//  Created by Brian Strobach on 1/14/19.
//

// swiftlint:disable type_name
public protocol TuplePairBacked {
    associatedtype F
    associatedtype S
    var values: (F, S) { get set }
    init(_ first: F, _ second: S)
}

extension TuplePairBacked {
    public var first: F {
        get {
            return values.0
        }
        set {
            values.0 = newValue
        }
    }
    public var second: S {
        get {
            return values.1
        }
        set {
            values.1 = newValue
        }
    }

}

open class Pair<T>: MixedPair<T, T> {
    public convenience init(_ duplicatedItem: T) {
        self.init(duplicatedItem, duplicatedItem)
    }
}

open class MixedPair<F, S>: TuplePairBacked {
    public var values: (F, S)

    public required init(_ first: F, _ second: S) {
        self.values = (first, second)
    }
}

public struct PairStruct<T>: TuplePairBacked {
    public typealias F = T
    public typealias S = T

    public var values: (T, T)

    public init(_ first: T, _ second: T) {
        self.values = (first, second)
    }

    public init(_ duplicatedItem: T) {
        self.init(duplicatedItem, duplicatedItem)
    }
}

public struct MixedPairStruct<F, S>: TuplePairBacked {
    public var values: (F, S)

    public init(_ first: F, _ second: S) {
        self.values = (first, second)
    }
}

public typealias TuplePair<T> = (first: T, second: T)
public typealias MixedTuplePair<F, S> = (first: F, second: S)

public typealias TupleTrio<T> = (first: T, second: T, third: T)
public typealias MixedTupleTrio<F, S, T> = (first: F, second: S, third: T)
