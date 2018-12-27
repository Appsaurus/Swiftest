//
//  Sequence+KeyPathValues.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/13/18.
//

import Foundation

extension Sequence {
    public func map<Value: Comparable>(_ keyPath: KeyPath<Element, Value>) -> [Value] {
        return self.map({$0[keyPath: keyPath]})
    }
    
    //Optional value KeyPaths
    public func compactMap<Value: Comparable>(_ keyPath: KeyPath<Element, Value?>) -> [Value] {
        return self.compactMap({$0[keyPath: keyPath]})
    }
}

extension Sequence {
    public func elementsHaveEqualValues<Value: Comparable>(at keyPath: KeyPath<Element, Value>, as otherCollection: Self, orderSensitive: Bool = false) -> Bool {
        return map(keyPath).containsEqualElements(otherCollection.map(keyPath), orderSensitive: orderSensitive)
    }
    
    public func elementsHaveEqualValues<Value: Comparable>(at keyPath: KeyPath<Element, Value?>, as otherCollection: Self, orderSensitive: Bool = false) -> Bool {
        return compactMap(keyPath).containsEqualElements(otherCollection.compactMap(keyPath), orderSensitive: orderSensitive)
    }
}

extension Collection where Element: Comparable {
    public func containsEqualElements(_ other: Self, orderSensitive: Bool = false) -> Bool {
        guard count == other.count else { return false }
        
        guard orderSensitive else { return self.sorted() == other.sorted()}
        return elementsEqual(other)
    }
}
