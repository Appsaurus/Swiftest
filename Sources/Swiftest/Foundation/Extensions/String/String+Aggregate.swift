//
//  String+Aggregate.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/18/18.
//

#if canImport(Foundation)
import Foundation

public extension String{
    public var letterCount: Int{
        let letters = CharacterSet.letters
        
        var letterCount = 0
        
        for uni in unicodeScalars {
            if letters.contains(UnicodeScalar(uni.value)!) {
                letterCount += 1
            }
        }
        return letterCount
    }
    
    public var digitCount: Int{
        let digits = CharacterSet.decimalDigits
        
        var digitCount = 0
        
        for uni in unicodeScalars {
            if digits.contains(UnicodeScalar(uni.value)!) {
                digitCount += 1
            }
        }
        return digitCount
    }
    
    /// Counts number of instances of a substring inside String
    public func count(_ substring: String) -> Int {
        return components(separatedBy: substring).count - 1
    }
}

#endif
