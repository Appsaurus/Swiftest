//
//  SignedInteger+.swift
//  Swiftest
//
//  Created by Brian Strobach on 8/15/17.
//  Copyright © 2018 Appsaurus
//
#if canImport(Foundation)
import Foundation
#endif

// MARK: - Properties
public extension SignedInteger {

    /// Swiftest: Check if integer is even.
    var isEven: Bool {
        return (self % 2) == 0
    }

    /// Swiftest: Check if integer is odd.
    var isOdd: Bool {
        return (self % 2) != 0
    }
}

// MARK: - Methods
public extension SignedInteger {
    
    /// Swiftest: Greatest common divisor of integer value and n.
    ///
    /// - Parameter n: integer value to find gcd with.
    /// - Returns: greatest common divisor of self and n.
    func gcd(of n: Self) -> Self {
        return n == 0 ? self : n.gcd(of: self % n)
    }
    
    /// Swiftest: Least common multiple of integer and n.
    ///
    /// - Parameter n: integer value to find lcm with.
    /// - Returns: least common multiple of self and n.
    func lcm(of n: Self) -> Self {
        return (self * n).abs / gcd(of: n)
    }

    #if canImport(Foundation)
    /// Swiftest: Ordinal representation of an integer.
    ///
    ///        print((12).ordinalString()) // prints "12th"
    ///
    /// - Parameter locale: locale, default is .current.
    /// - Returns: string ordinal representation of number in specified locale language. E.g. input 92, output in "en": "92nd".
    @available(iOS 9.0, macOS 10.11, *)
    func ordinalString(locale: Locale = .current) -> String? {
        let formatter = NumberFormatter()
        formatter.locale = locale
        formatter.numberStyle = .ordinal
        guard let number = self as? NSNumber else { return nil }
        return formatter.string(from: number)
    }
    #endif
}

extension SignedInteger {
    /// Swiftest: String of format (XXh XXm) from seconds Int.
    public var timeString: String {
        guard self > 0 else {
            return "0 sec"
        }
        if self < 60 {
            return "\(self) sec"
        }
        if self < 3600 {
            return "\(self / 60) min"
        }
        let hours = self / 3600
        let mins = (self % 3600) / 60
        
        if hours != 0 && mins == 0 {
            return "\(hours)h"
        }
        return "\(hours)h \(mins)m"
    }
}
