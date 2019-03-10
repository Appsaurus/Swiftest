//
//  Defaultable.swift
//  Swiftest
//
//  Created by Brian Strobach on 1/14/19.
//

public protocol Defaultable {
    static var `default`: Self { get }
}

extension Defaultable where Self: EmptyInitializable {
    public static var `default`: Self { return .init() }
}

public typealias DefaultEmptyInitializable = Defaultable & EmptyInitializable
