//
//  KeyValuePair.swift
//  Swiftest
//
//  Created by Brian Strobach on 11/13/18.
//

import Foundation

extension WritableKeyPath{
    public func with(value: Value) -> WritableKeyPathApplicator<Root>{
        return WritableKeyPathApplicator(self, value)
    }
}

precedencegroup KeyPathApplicatorPrecedence {
    associativity: right
    higherThan: AdditionPrecedence
}

infix operator => : KeyPathApplicatorPrecedence

public func =><V, R, WKP: WritableKeyPath<R, V>> (lhs: WKP, rhs: V) -> WritableKeyPathApplicator<R>{
    return lhs.with(value: rhs)
}

public struct WritableKeyPathApplicator<Type> {
    private let applicator: (Type) -> Type
    private let value: Any
    init<ValueType>(_ keyPath: WritableKeyPath<Type, ValueType>, _ value: ValueType) {
        self.value = value
        applicator = {
            var instance = $0
            instance[keyPath: keyPath] = value
            return instance
        }
    }
    func apply(to instance: Type) -> Type {
        return applicator(instance)
    }
}
