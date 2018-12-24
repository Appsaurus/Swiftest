//
//  Sequence+Aggregate.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/12/18.
//

extension Sequence {
    
    /// Swiftest: Get element count based on condition.
    ///
    ///        [2, 2, 4, 7].count(where: {$0 % 2 == 0}) -> 3
    ///
    /// - Parameter condition: condition to evaluate each element against.
    /// - Returns: number of times the condition evaluated to true.
    public func count(where condition: (Element) throws -> Bool) rethrows -> Int {
        var count = 0
        for element in self where try condition(element) {
            count += 1
        }
        return count
    }
}

// MARK: - Methods (Numeric)
public extension Sequence where Element: Numeric {
    
    /// Swiftest: Sum of all elements in array.
    ///
    ///        [1, 2, 3, 4, 5].sum -> 15
    ///
    /// - Returns: sum of the array's elements.
    public var sum: Element {
        return reduce(0, {$0 + $1})
    }
    
    /**
     - returns: Arithmetic mean of values in collection
     */
//    public var mean: Element {
//        return self.sum / self.count
//    }
    
}

public protocol Averageable: Numeric {
    associatedtype AverageType: Numeric
    var average: AverageType { get }
}

extension Collection where Element: BinaryInteger {
    /// Swiftest: Average of all elements in array.
    ///
    ///        [1, 2, 3, 4, 5].average = 3.0
    ///
    /// - Returns: average of the array's elements.
    public var average: Double {
        return isEmpty ? 0 : Double(sum) / Double(count)
    }
    
    /// Swiftest: Mean of all elements in array. Alias for average.
    ///
    ///        [1, 2, 3, 4, 5].average = 3.0
    ///
    /// - Returns: average of the array's elements.
    public var mean: Double {
        return average
    }
}

extension BidirectionalCollection where Element: BinaryInteger {
    /// Swiftest: Median of all elements in array.
    ///
    ///        [1, 2, 3, 4, 5].median -> 3
    ///
    /// - Returns: sum of the array's elements.
    public var median: Double? {
        return self.map({Double($0)}).average
    }
}

extension Collection where Element: FloatingPoint {
    /// Swiftest: Average of all elements in array.
    ///
    ///        [1.2, 2.3, 4.5, 3.4, 4.5].average = 3.18
    ///
    /// - Returns: average of the array's elements.
    /// Returns the average of all elements in the array
    public var average: Element {
        return isEmpty ? 0 : sum / Element(count)
    }
}

extension BidirectionalCollection where Element: FloatingPoint {
    /// Swiftest: Median of all elements in array.
    ///
    ///        [1.3, 2.3, 3.8, 4.1, 5.5].median -> 3.8
    ///
    /// - Returns: sum of the array's elements.
    public var median: Element? {
        guard let firstElement = first, let sorted = sorted() as? Self else { return nil}
        guard count > 1 else { return firstElement }
        let middleIndex = midIndex
        if self.count.isEven {
            let midLeft = sorted[middleIndex]
            let midRight = sorted[sorted.index(after: middleIndex)]
            return [midLeft, midRight].average
        } else {
            return sorted[middleIndex]
        }
    }
}
