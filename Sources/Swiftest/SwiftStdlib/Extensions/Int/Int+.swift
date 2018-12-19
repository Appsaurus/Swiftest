//
//  Int+.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/18/18.
//


#if canImport(CoreGraphics)
import CoreGraphics
#endif
// MARK: - Properties
public extension Int {
    
    /// Swiftest: CountableRange 0..<Int.
    public var countableRange: CountableRange<Int> {
        return 0..<self
    }
    
    /// Swiftest: UInt.
    public var uInt: UInt {
        return UInt(self)
    }
    
    /// Swiftest: String formatted for values over ±1000 (example: 1k, -2k, 100k, 1kk, -5kk..)
    public var kFormatted: String {
        var sign: String {
            return self >= 0 ? "" : "-"
        }
        let abs = Swift.abs(self)
        if abs == 0 {
            return "0k"
        } else if abs >= 0 && abs < 1000 {
            return "0k"
        } else if abs >= 1000 && abs < 1000000 {
            return String(format: "\(sign)%ik", abs / 1000)
        }
        return String(format: "\(sign)%ikk", abs / 100000)
    }
}

extension Int{
    
    /// Swiftest: Array of digits of integer value.
    public var digits: [Int] {
        guard self != 0 else { return [0] }
        var digits = [Int]()
        var number = abs
        
        while number != 0 {
            let xNumber = number % 10
            digits.append(xNumber)
            number /= 10
        }
        
        digits.reverse()
        return digits
    }
    
    /// Swiftest: Number of digits of integer value.
    public var digitsCount: Int {
        #if canImport(CoreGraphics)
            guard self != 0 else { return 1 }
            let number = Double(abs)
            return Int(log10(number) + 1)
        #else
            return digits.count
        #endif
    }
}

// MARK: - Methods
public extension Int {
    #if canImport(CoreGraphics)
    /// Swiftest: check if given integer prime or not.
    /// Warning: Using big numbers can be computationally expensive!
    /// - Returns: true or false depending on prime-ness
    public func isPrime() -> Bool {
        // To improve speed on latter loop :)
        if self == 2 {
            return true
        }
        
        guard self > 1 && self % 2 != 0 else {
            return false
        }
        // Explanation: It is enough to check numbers until
        // the square root of that number. If you go up from N by one,
        // other multiplier will go 1 down to get similar result
        // (integer-wise operation) such way increases speed of operation
        let base = Int(sqrt(Double(self)))
        for int in Swift.stride(from: 3, through: base, by: 2) where self % int == 0 {
            return false
        }
        return true
    }
    
    
    
    // swiftlint:disable next identifier_name
    /// Swiftest: Rounds to the closest multiple of n
    public func roundToNearest(_ n: Int) -> Int {
        return n == 0 ? self : Int(round(Double(self) / Double(n))) * n
    }
    #endif
    
    /// Swiftest: Roman numeral string from integer (if applicable).
    ///
    ///10.romanNumeral() -> "X"
    ///
    /// - Returns: The roman numeral string.
    public func romanNumeral() -> String? {
        // https://gist.github.com/kumo/a8e1cb1f4b7cff1548c7
        guard self > 0 else { // there is no roman numerals for 0 or negative numbers
            return nil
        }
        let romanValues = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
        let arabicValues = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        
        var romanValue = ""
        var startingValue = self
        
        for (index, romanChar) in romanValues.enumerated() {
            let arabicValue = arabicValues[index]
            let div = startingValue / arabicValue
            if div > 0 {
                for _ in 0..<div {
                    romanValue += romanChar
                }
                startingValue -= arabicValue * div
            }
        }
        return romanValue
    }
}


