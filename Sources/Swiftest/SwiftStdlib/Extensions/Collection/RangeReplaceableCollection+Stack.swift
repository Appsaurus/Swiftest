//
//  RangeReplaceableCollection+Stack.swift
//  Pods
//
//  Created by Brian Strobach on 4/20/16.
//  Copyright © 2018 Appsaurus
//

/// RangeReplaceableCollection based Stack(LIFO) implementation
public typealias Stack = RangeReplaceableCollection

public extension Stack {
    
    mutating func push(_ newElement: Element) {
        self.append(newElement)
    }
    
    mutating func pop() -> Element? {
        return self.remove(at: lastIndex)
    }
    
    func peekAtStack() -> Element? {
        return self[safe: lastIndex]
    }
}
