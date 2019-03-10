//
//  DefaultMutable.swift
//  Swiftest
//
//  Created by Brian Strobach on 1/14/19.
//

public protocol DefaultMutable: Defaultable {
    static var defaultConstructor: ClosureOut<Self> { get set }
}
extension DefaultMutable {
    public static var `default`: Self {
        return defaultConstructor()
    }
}

public typealias DefaultMutableEmptyInitializable = DefaultMutable & EmptyInitializable
