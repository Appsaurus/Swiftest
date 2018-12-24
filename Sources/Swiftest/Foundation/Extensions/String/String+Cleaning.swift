//
//  String+Cleaning.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/18/18.
//

#if canImport(Foundation)
import Foundation

extension String {
    
    /// Swiftest: String with no spaces or new lines in beginning and end.
    ///
    ///        "   hello  \n".trimmed -> "hello"
    ///
    public var trimmed: String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// Swiftest: Removes spaces and new lines in beginning and end of string.
    ///
    ///        var str = "  \n Hello World \n\n\n"
    ///        str.trim()
    ///        print(str) // prints "Hello World"
    ///
    public mutating func trim() {
        self = self.trimmed
    }
    
    public mutating func trimCharacters(_ characterSet: CharacterSet) {
        self = self.trimmingCharacters(in: characterSet)
    }

    /// Swiftest: String without spaces and new lines.
    ///
    ///        "   \n Swifter   \n  Swift  ".withoutSpacesAndNewLines -> "Swiftest"
    ///
    public var withoutSpacesAndNewLines: String {
        return replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "\n", with: "")
    }
    
}

#endif
