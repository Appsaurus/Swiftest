//
//  KeyValueReadable.swift
//  Pods
//
//  Created by Brian Strobach on 4/15/16.
//  Copyright © 2018 Appsaurus
//

import Foundation

public protocol KeyValueReadable {
    
    func valueForKey<T>(_ key: String) -> T?
    
    func valueForKeyPath<T>(_ keyPath: String) -> T?
    
    subscript (key: String) -> Any? { get }
}

public extension KeyValueReadable {
    
    /// Returns the value for the property identified by a given key.
    public func valueForKey<T>(_ key: String) -> T? {
        
        let mirror: Mirror = Mirror(reflecting: self)
        
        for child in mirror.children where child.label == key {
            return child.value as? T
        }
        return nil
    }
    
    /// Returns the value for the derived property identified by a given key path.
    public func valueForKeyPath<T>(_ keyPath: String) -> T? {
        
        let keys = keyPath.split(separator: ".").map {String($0)}
        
        var mirror = Mirror(reflecting: self)
        
        for key in keys {
            for child in mirror.children where child.label == key {
                if child.label == keys.last {
                    return child.value as? T
                } else {
                    mirror = Mirror(reflecting: child)
                }
            }

        }
        return nil
    }
    
    /// Returns the value for the property identified by a given key.
    public subscript (key: String) -> Any? {
        return self.valueForKeyPath(key)
    }
}
