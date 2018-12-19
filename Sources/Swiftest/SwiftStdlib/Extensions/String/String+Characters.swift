//
//  String+Lookup.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/18/18.
//


extension String{
    /// Swiftest: First character of string (if applicable).
    ///
    ///        "Hello".firstCharacterAsString -> Optional("H")
    ///        "".firstCharacterAsString -> nil
    ///
    public var firstCharacterAsString: String? {
        guard let first = first else { return nil }
        return String(first)
    }

    /// Swiftest: Last character of string (if applicable).
    ///
    ///        "Hello".lastCharacterAsString -> Optional("o")
    ///        "".lastCharacterAsString -> nil
    ///
    public var lastCharacterAsString: String? {
        guard let last = last else { return nil }
        return String(last)
    }
    
    /// Swiftest: Array of characters of a string.
    public var charactersArray: [Character] {
        return Array(self)
    }
    

    
    /// Swiftest: Array with unicodes for all characters in a string.
    ///
    ///        "Swiftest".unicodeArray() -> [83, 119, 105, 102, 116, 101, 114, 83, 119, 105, 102, 116]
    ///
    /// - Returns: The unicodes for all characters in a string.
    public func unicodeArray() -> [Int] {
        return unicodeScalars.map { Int($0.value) }
    }
}
