//
//  KeyPathValuePair.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/27/18.
//

public typealias KeyPathValuePairs<Type> = [KeyPathValuePair<Type>]

public struct KeyPathValuePair<Type> {
    private let applicator: (Type) -> Type
    private let value: Any
    public init<ValueType>(_ keyPath: WritableKeyPath<Type, ValueType>, _ value: ValueType) {
        self.value = value
        applicator = {
            var instance = $0
            instance[keyPath: keyPath] = value
            return instance
        }
    }

    @discardableResult
    public func apply(to instance: Type) -> Type {
        return applicator(instance)
    }
}

extension WritableKeyPath {
    public func with(value: Value) -> KeyPathValuePair<Root> {
        return KeyPathValuePair(self, value)
    }
}

precedencegroup KeyPathValueBinderPrecedence {
    associativity: right
    higherThan: AdditionPrecedence
}

infix operator => : KeyPathValueBinderPrecedence

public func =><V, R, WKP: WritableKeyPath<R, V>> (lhs: WKP, rhs: @autoclosure () -> V) -> KeyPathValuePair<R> {
    return lhs.with(value: rhs())
}

public func assign<O: Any>(_ keyPathValuePairs: KeyPathValuePairs<O>, to object: O) {
    for keyPathValuePair in keyPathValuePairs {
        keyPathValuePair.apply(to: object)
    }
}

@discardableResult
public func +=<O> (lhs: O, rhs: KeyPathValuePairs<O>) -> O {
    assign(rhs, to: lhs)
    return lhs
}
