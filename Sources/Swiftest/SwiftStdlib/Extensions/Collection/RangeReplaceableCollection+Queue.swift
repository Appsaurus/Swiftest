//
//  RangeReplaceableCollection+Queue.swift
//  Pods
//
//  Created by Brian Strobach on 4/20/16.
//  Copyright © 2018 Appsaurus
//

import Foundation

/// RangeReplaceableCollection based Queue(FIFO) implementation
public typealias Queue = RangeReplaceableCollection

public extension Queue {
    mutating func enqueue(_ newElement: Element) {
        self.append(newElement)
    }
    
    mutating func dequeue() -> Element? {
        guard count > 0 else { return nil }
        return self.remove(at: startIndex)
    }
    
    func peekAtQueue() -> Element? {
        return self.first
    }
}
