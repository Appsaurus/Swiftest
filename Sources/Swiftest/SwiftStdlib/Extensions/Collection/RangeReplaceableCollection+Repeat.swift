//
//  ArrayExtensions.swift
//  Swiftest
//
//  Created by Brian Strobach on 2/17/16.
//  Copyright © 2018 Appsaurus
//

import Foundation


extension RangeReplaceableCollection{
    /// Creates a new collection of a given size where for each position of the collection the value will be the result
    /// of a call of the given expression.
    ///
    ///     let values = Array(expression: "Value", count: 3)
    ///     print(values)
    ///     // Prints "["Value", "Value", "Value"]"
    ///
    /// - Parameters:
    ///   - expression: The expression to execute for each position of the collection.
    ///   - count: The count of the collection.
    public init(expression: @autoclosure () throws -> Element, count: Int) rethrows {
        self.init()
        if count > 0 { //swiftlint:disable:this empty_count
            reserveCapacity(count)
            while self.count < count {
                append(try expression())
            }
        }
    }
    
    public func repeated(count: Int, separatedBy separator: Element? = nil) -> Self{
        let copy: Self = self
        var output: Self = self
        count.times{
            if let separator = separator{
                output.append(separator)
            }
            output.append(contentsOf: copy)
        }
        return output
    }
}
