//
//  EquatableExtensions.swift
//  Pods
//
//  Created by Brian Strobach on 10/18/17.
//

extension Equatable {
    
    public func equalToAny(of items: [Self]) -> Bool {
        return items.contains(where: { (item) -> Bool in
            item == self
        })
    }
    
    public func equalToAny(of items: Self...) -> Bool {
        return equalToAny(of: items)
    }
}
