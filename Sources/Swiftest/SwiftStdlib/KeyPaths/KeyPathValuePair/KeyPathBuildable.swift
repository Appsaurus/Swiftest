//
//  KeyPathBuildable.swift
//  Swiftest
//
//  Created by Brian Strobach on 1/14/19.
//

public protocol KeyPathBuildable: class {
    func with<T>(_ keyPath: WritableKeyPath<Self, T>, _ value: T) -> Self
    func with(_ keyPathValuePairs: KeyPathValuePairs<Self>) -> Self
    func with(_ keyPathValuePair: KeyPathValuePair<Self>...) -> Self
}

extension KeyPathBuildable {
    @discardableResult
    public func with<T>(_ keyPath: WritableKeyPath<Self, T>, _ value: T) -> Self {
        return with(keyPath.with(value: value))
    }

    @discardableResult
    public func with(_ keyPathValuePair: KeyPathValuePair<Self>...) -> Self {
        return with(keyPathValuePair)
    }

    @discardableResult
    public func with(_ keyPathValuePairs: KeyPathValuePairs<Self>) -> Self {
        return self += keyPathValuePairs
    }
}
