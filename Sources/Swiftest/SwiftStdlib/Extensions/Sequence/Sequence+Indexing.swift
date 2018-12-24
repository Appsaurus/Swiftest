//
//  Sequence+Indexing.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/17/18.
//

extension Sequence {
    public func indexed<Key>(on keyPath: KeyPath<Element, Key>) -> [Key: Element] where Key: Hashable {
        return indexed(by: { $0[keyPath: keyPath] })
    }
    
    public func indexed<Key>(by keyFunction: (Element) throws -> Key) rethrows -> [Key: Element] where Key: Hashable {
        var dictionary: [Key: Element] = [:]
        try forEach { (value) in
            dictionary[try keyFunction(value)] = value
        }
        return dictionary
    }
    
    public func allSatisfy(_ condition: (Element) -> Bool) -> Bool {
        for element in self {
            if !condition(element) {
                return false
            }
        }
        return true
    }
}
