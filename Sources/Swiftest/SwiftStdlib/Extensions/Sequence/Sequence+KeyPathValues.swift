//
//  Sequence+KeyPathValues.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/13/18.
//

import Foundation

extension Sequence {
    public func valuesOfElements<Value: Comparable>(at keyPath: KeyPath<Element, Value>) -> [Value] {
        return self.map({$0[keyPath: keyPath]})
    }
    
    //Optional value KeyPaths
    public func valuesOfElements<Value: Comparable>(at keyPath: KeyPath<Element, Value?>) -> [Value] {
        return self.map({$0[keyPath: keyPath]}).compactMap({$0})
    }
}

extension Sequence {
    public func elementsHaveEqualValues<Value: Comparable>(at keyPath: KeyPath<Element, Value>, as otherCollection: Self, orderSensitive: Bool = false) -> Bool {
        return valuesOfElements(at: keyPath).containsEqualElements(otherCollection.valuesOfElements(at: keyPath), orderSensitive: orderSensitive)
    }
    
    public func elementsHaveEqualValues<Value: Comparable>(at keyPath: KeyPath<Element, Value?>, as otherCollection: Self, orderSensitive: Bool = false) -> Bool {
        return valuesOfElements(at: keyPath).containsEqualElements(otherCollection.valuesOfElements(at: keyPath), orderSensitive: orderSensitive)
    }
}

extension Collection where Element: Comparable {
    public func containsEqualElements(_ other: Self, orderSensitive: Bool = false) -> Bool {
        guard count == other.count else { return false }
        
        guard orderSensitive else { return self.sorted() == other.sorted()}
        return elementsEqual(other)
    }
}
