//
//  PropertyReflectable.swift
//  Pods
//
//  Created by Brian Strobach on 7/15/17.
//
//

import Foundation

protocol PropertyReflectable {
    func propertyNames() -> [String]
}

extension PropertyReflectable {
    public func propertyNames() -> [String] {
		return Mirror(reflecting: self).children.compactMap { $0.label }
    }
}
