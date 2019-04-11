//
//  Sequence+Grouping.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/12/18.
//

public extension Sequence {
    
    func grouped<Key>(by keyPath: KeyPath<Element, Key>) -> [Key: [Element]] where Key: Hashable {
        return grouped(by: { $0[keyPath: keyPath] })
    }
    
    func grouped<Key>(by keyFunction: (Element) -> Key) -> [Key: [Element]] where Key: Hashable {
        var dict: [Key: [Iterator.Element]] = [:]
        for value in self {
            let key = keyFunction(value)
            dict[key, default: []].append(value)
        }
        return dict
    }
    
    func grouped<Key>(by keyFunction: (Element) throws -> Key?) rethrows -> (dictionary: [Key: [Element]], unkeyed: [Element]) where Key: Hashable {
        var dict: [Key: [Element]] = [:]
        var unkeyedArray: [Element] = []
        for value in self {
            if let key = try keyFunction(value) {
                dict[key, default: []].append(value)
            } else {
                unkeyedArray.append(value)
            }
        }
        return (dict, unkeyedArray)
    }
}
