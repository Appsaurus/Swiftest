////
////  StringExtensions.swift
////  Swiftest
////
////  Created by Brian Strobach on 8/5/16.
////  Copyright © 2018 Appsaurus
////
//
//#if canImport(Foundation)
//import Foundation
//#endif
//
//
//#if canImport(CoreGraphics)
//import CoreGraphics
//#endif
//
//// MARK: - Properties
//public extension String {
//
//    #if canImport(Foundation)
//    /// Swiftest: CamelCase of string.
//    ///
//    ///        "sOme vAriable naMe".camelCased -> "someVariableName"
//    ///
//    public var camelCased: String {
//        let source = lowercased()
//        let first = source[..<source.index(after: source.startIndex)]
//        if source.contains(" ") {
//            let connected = source.capitalized.replacingOccurrences(of: " ", with: "")
//            let camel = connected.replacingOccurrences(of: "\n", with: "")
//            let rest = String(camel.dropFirst())
//            return first + rest
//        }
//        let rest = String(source.dropFirst())
//        return first + rest
//    }
//    #endif
//
//    #if canImport(Foundation)
//    /// Swiftest: Check if string is valid email format.
//    ///
//    /// - Note: Note that this property does not validate the email address against an email server. It merely attempts to determine whether its format is suitable for an email address.
//    ///
//    ///        "john@doe.com".isValidEmail -> true
//    ///
//    public var isValidEmail: Bool {
//        // http://emailregex.com/
//        let regex = "^(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])$"
//        return range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
//    }
//    
//    /// Checks if String contains Email
//    public var isEmail: Bool {
//        let dataDetector: NSDataDetector? = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
//        let firstMatch: NSTextCheckingResult? = dataDetector?.firstMatch(in: self, options: NSRegularExpression.MatchingOptions.reportCompletion, range: NSRange(location: 0, length: length))
//        return (firstMatch?.range.location != NSNotFound && firstMatch?.url?.scheme == "mailto")
//    }
//    #endif
//}
//
//// MARK: - Initializers
//public extension String {
//
//    public static func random(ofLength length: Int) -> String {
//        return String(randomOfLength: length)
//    }
//
//    /// Swiftest: Create a new random string of given length.
//    ///
//    ///        String(randomOfLength: 10) -> "gY8r3MHvlQ"
//    ///
//    /// - Parameter length: number of characters in string.
//    public init(randomOfLength length: Int) {
//        guard length > 0 else {
//            self.init()
//            return
//        }
//
//        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
//        var randomString = ""
//        for _ in 1...length {
//            randomString.append(base.randomElement()!)
//        }
//        self = randomString
//    }
//}
