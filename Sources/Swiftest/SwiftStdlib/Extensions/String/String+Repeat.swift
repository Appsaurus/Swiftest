//
//  String+Repeat.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/18/18.
//

import Foundation

// MARK: - Operators
public extension String {
  
//TODO: Test RangeRepeatable implementation
//    public func repeated(count: Int, separatedBy separator: String? = nil) -> String{
//        guard count > 0 else { return "" }
//        guard let separator = separator else{
//            return self * count
//        }
//        
//        let string = self + separator
//        return String((string * count).dropLast())
//    }
    
    /// Swiftest: Repeat string multiple times.
    ///
    ///        'bar' * 3 -> "barbarbar"
    ///
    /// - Parameters:
    ///   - lhs: string to repeat.
    ///   - rhs: number of times to repeat character.
    /// - Returns: new string with given string repeated n times.
    public static func * (lhs: String, rhs: Int) -> String {
        guard rhs > 0 else { return "" }
        return String(repeating: lhs, count: rhs)
    }
    
    /// Swiftest: Repeat string multiple times.
    ///
    ///        3 * 'bar' -> "barbarbar"
    ///
    /// - Parameters:
    ///   - lhs: number of times to repeat character.
    ///   - rhs: string to repeat.
    /// - Returns: new string with given string repeated n times.
    public static func * (lhs: Int, rhs: String) -> String {
        guard lhs > 0 else { return "" }
        return String(repeating: rhs, count: lhs)
    }
    
}
