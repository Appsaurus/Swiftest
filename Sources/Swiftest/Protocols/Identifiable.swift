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
