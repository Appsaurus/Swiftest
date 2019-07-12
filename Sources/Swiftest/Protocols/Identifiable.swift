//
//  Identifiable.swift
//  Swiftest
//
//  Created by Brian Strobach on 7/10/19.
//

import Foundation

public protocol Identifiable: Hashable {
    associatedtype ID: Hashable
    var id: ID { get }
}
public extension Identifiable {
    var hashValue: Int {
        return id.hashValue
    }
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}
