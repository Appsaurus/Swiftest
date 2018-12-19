//
//  Dictionary+Merging.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/16/18.
//


public func +<Key, Value> (lhs: [Key: Value], rhs: [Key: Value]) -> [Key: Value] {
    return lhs.merged(with: rhs)
}

@discardableResult
public func +=<Key, Value> (lhs: inout [Key: Value], rhs: [Key: Value]) -> [Key: Value] {
    return lhs.merge(with: rhs)
}

extension Dictionary {
    
    @discardableResult
    public mutating func merge(with dictionary: Dictionary) -> Dictionary{
        dictionary.forEach { updateValue($1, forKey: $0) }
        return self
    }
    
    public func merged(with dictionary: Dictionary) -> Dictionary {
        var dict = self
        dict.merge(with: dictionary)
        return dict
    }
}
