//
//  ObjectDisplayable.swift
//  Pods
//
//  Created by Brian Strobach on 9/12/16.
//
//

import Foundation

public protocol ObjectDisplayable: AnyObject {
    associatedtype DisplayableObjectType
    func display(object: DisplayableObjectType)
}

public protocol ContextualObjectDisplayable {
    associatedtype DisplayableObjectContextType
    associatedtype DisplayableObjectType
    func display(object: DisplayableObjectType, context: DisplayableObjectContextType)
}

public extension Array where Element: ObjectDisplayable {
    func display(object: Element.DisplayableObjectType) {
        for element in self {
            element.display(object: object)
        }
    }
}
