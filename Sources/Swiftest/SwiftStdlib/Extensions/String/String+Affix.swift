//
//  String+Affix.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/18/18.
//

extension String {
    
    /// Swiftest: Pad string to fit the length parameter size with another string in the start.
    ///
    ///   "hue".padStart(10) -> "       hue"
    ///   "hue".padStart(10, with: "br") -> "brbrbrbhue"
    ///
    /// - Parameter length: The target length to pad.
    /// - Parameter string: Pad string. Default is " ".
    public mutating func padStart(_ length: Int, with string: String = " ") {
        self = paddingStart(length, with: string)
    }
    
    /// Swiftest: Returns a string by padding to fit the length parameter size with another string in the start.
    ///
    ///   "hue".paddingStart(10) -> "       hue"
    ///   "hue".paddingStart(10, with: "br") -> "brbrbrbhue"
    ///
    /// - Parameter length: The target length to pad.
    /// - Parameter string: Pad string. Default is " ".
    /// - Returns: The string with the padding on the start.
    public func paddingStart(_ length: Int, with string: String = " ") -> String {
        guard count < length else { return self }
        
        let padLength = length - count
        if padLength < string.count {
            return string[string.startIndex..<string.index(string.startIndex, offsetBy: padLength)] + self
        } else {
            var padding = string
            while padding.count < padLength {
                padding.append(string)
            }
            return padding[padding.startIndex..<padding.index(padding.startIndex, offsetBy: padLength)] + self
        }
    }
    
    /// Swiftest: Pad string to fit the length parameter size with another string in the start.
    ///
    ///   "hue".padEnd(10) -> "hue       "
    ///   "hue".padEnd(10, with: "br") -> "huebrbrbrb"
    ///
    /// - Parameter length: The target length to pad.
    /// - Parameter string: Pad string. Default is " ".
    public mutating func padEnd(_ length: Int, with string: String = " ") {
        self = paddingEnd(length, with: string)
    }
    
    /// Swiftest: Returns a string by padding to fit the length parameter size with another string in the end.
    ///
    ///   "hue".paddingEnd(10) -> "hue       "
    ///   "hue".paddingEnd(10, with: "br") -> "huebrbrbrb"
    ///
    /// - Parameter length: The target length to pad.
    /// - Parameter string: Pad string. Default is " ".
    /// - Returns: The string with the padding on the end.
    public func paddingEnd(_ length: Int, with string: String = " ") -> String {
        guard count < length else { return self }
        
        let padLength = length - count
        if padLength < string.count {
            return self + string[string.startIndex..<string.index(string.startIndex, offsetBy: padLength)]
        } else {
            var padding = string
            while padding.count < padLength {
                padding.append(string)
            }
            return self + padding[padding.startIndex..<padding.index(padding.startIndex, offsetBy: padLength)]
        }
    }
    
    /// Swiftest: Removes given prefix from the string.
    ///
    ///   "Hello, World!".removingPrefix("Hello, ") -> "World!"
    ///
    /// - Parameter prefix: Prefix to remove from the string.
    /// - Returns: The string after prefix removing.
    public func removingPrefix(_ prefix: String) -> String {
        guard hasPrefix(prefix) else { return self }
        return String(dropFirst(prefix.count))
    }
    
    /// Swiftest: Removes given suffix from the string.
    ///
    ///   "Hello, World!".removingSuffix(", World!") -> "Hello"
    ///
    /// - Parameter suffix: Suffix to remove from the string.
    /// - Returns: The string after suffix removing.
    public func removingSuffix(_ suffix: String) -> String {
        guard hasSuffix(suffix) else { return self }
        return String(dropLast(suffix.count))
    }
    
}
