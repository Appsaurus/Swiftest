//
//  Int+WrappedToRange.swift
//  Swiftest
//
//  Created by Brian Strobach on 7/30/19.
//

import Foundation

public extension Int {
    func wrappedWithin(_ range: ClosedRange<Int>) -> Int {
        print("Input: \(self) \(range)")
        let min = range.lowerBound
        let max = range.upperBound
        let rangeSize = max - min + 1

        if range.contains(self){
            return self
        }

        if self < min {
            print("Distance \(min.distance(to: self))")
            let remainder = min.distance(to: self).abs % rangeSize
            if remainder == 0 { return min}
            let output = (max - remainder) + 1
            print("Output: \(output)")
            return output
        }

         let remainder = max.distance(to: self).abs % rangeSize
        if remainder == 0 { return max}
        let output = (min + remainder) - 1
        print("Output: \(output)")
        return output

    }
}
