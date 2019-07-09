// Swiftest iOS Playground

//import UIKit

var str = "Hello, playground"

public extension Int {
    func wrappedWithin(_ range: ClosedRange<Int>) -> Int {
        let min = range.lowerBound
        let max = range.upperBound
        let rangeSize = max - min + 1
        guard self > 0 else {
            return max - (min - self).wrappedWithin(range) + 1
        }
        let value = self % rangeSize
        return value == 0 ? max : value
    }
}

extension ClosedRange where Element == Int {
    func wrap(_ value: Int) -> Int {
        return value.wrappedWithin(self)
    }
}
let range = 1...7
range.wrap(-2)
range.wrap(-1)
range.wrap(0)
range.wrap(-7)
-2.wrappedWithin(range)

0.wrappedWithin(range)
