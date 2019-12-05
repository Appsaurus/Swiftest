//
//  Sequence+KeyPathValues.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/13/18.
//

import Foundation

//MARK: - KeyPath write

public extension Sequence {
    func map<Value>(_ keyPath: KeyPath<Element, Value>) -> [Value] {
        return self.map({$0[keyPath: keyPath]})
    }
    
    //Optional value KeyPaths
    func compactMap<Value>(_ keyPath: KeyPath<Element, Value?>) -> [Value] {
        return self.compactMap({$0[keyPath: keyPath]})
    }


    func contains<Value: Comparable>(value: Value, at keyPath: KeyPath<Element, Value>) -> Bool {
        return self.map(keyPath).contains(value)
    }

    func elements<Value: Comparable>(where keyPath: KeyPath<Element, Value>, _ function: (Value, Value) -> Bool = (==), value: Value) -> [Element] {
        return self.find { (element) -> Bool in
            return function(element[keyPath: keyPath], value)
        }
    }
}


//MARK: - KeyPath write

public extension Sequence where Self: MutableCollection {

  mutating func assign<Value>(value: Value,
                              to keyPath: WritableKeyPath<Element, Value>) {
    guard !isEmpty else { return }
    var i = startIndex
    repeat {
      self[i][keyPath: keyPath] = value
      i = index(after: i)
    } while  i != endIndex
  }
}

//MARK: - Subscripts
public extension Sequence {

    subscript<Value>(_ keyPath: KeyPath<Element, Value>) -> [Value] {
        return self.map(keyPath)
    }

    subscript<Value>(_ keyPath: KeyPath<Element, Value?>) -> [Value] {
        return self.compactMap(keyPath)
    }
}

//Write only
public extension Sequence where Self: MutableCollection {
    subscript<Value>(_ keyPath: WritableKeyPath<Element, Value>) -> Value {
        get {
            assertionFailure()
            return self.first![keyPath: keyPath]
        }
        set(newValue){
            assign(value: newValue, to: keyPath)
        }
    }

    subscript<Value>(_ keyPath: WritableKeyPath<Element, Value?>) -> Value? {
        get {
            assertionFailure()
            return self.first?[keyPath: keyPath]
        }
        set(newValue){
            assign(value: newValue, to: keyPath)
        }
    }
}

public extension Sequence {
    func elementsHaveEqualValues<Value: Comparable>(at keyPath: KeyPath<Element, Value>, as otherCollection: Self, orderSensitive: Bool = false) -> Bool {
        return map(keyPath).containsEqualElements(otherCollection.map(keyPath), orderSensitive: orderSensitive)
    }
    
    func elementsHaveEqualValues<Value: Comparable>(at keyPath: KeyPath<Element, Value?>, as otherCollection: Self, orderSensitive: Bool = false) -> Bool {
        return compactMap(keyPath).containsEqualElements(otherCollection.compactMap(keyPath), orderSensitive: orderSensitive)
    }
}

public extension Collection where Element: Comparable {
    func containsEqualElements(_ other: Self, orderSensitive: Bool = false) -> Bool {
        guard count == other.count else { return false }
        
        guard orderSensitive else { return self.sorted() == other.sorted()}
        return elementsEqual(other)
    }
}



