//
//  String+.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/18/18.
//

#if canImport(CoreGraphics)
import CoreGraphics
#endif

#if canImport(Foundation)
import Foundation
#endif

//TODO: Cleanup these extensions. Organize into separate files, remove redundant methods and test.
public extension String {
    
    static func whitespace(count: Int = 1) -> String {
        return " ".repeated(count: count)
    }

}

extension String {
    subscript (bounds: CountableClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start...end])
    }

    subscript (bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }
}

public extension String {

    func subString(upToIndex index: Int) -> String {
        return subString(0, length: index)
    }
    
    func subString(_ start: Int, length: Int? = nil) -> String {

        if let length = length {
            return self[start..<start + length]
        }
        return self[start..<self.length]
    }
    
    func subString(_ range: NSRange) -> String {
        return subString(range.location, length: range.length)
    }
    
    mutating func remove(substrings: String...) {
        self = self.stringAfterReplacing(substrings: substrings, with: "")
    }
    
    func stringAfterRemoving(substrings: String...) -> String {
        return stringAfterReplacing(substrings: substrings, with: "")
    }
    
    func stringAfterReplacing(substrings: [String], with replacement: String) -> String {
        var copy = self
        for string in substrings {
            if let range = copy.range(of: string) {
                copy.replaceSubrange(range, with: replacement)
            }
        }
        return copy
    }
    
    // MARK: Regex
    func regexSplit(_ pattern: String) -> [String] {
        do {
            let regex: NSRegularExpression = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
            let stop: String = "&උටෟ#ߤჀ"
            let modifiedString: String = regex.stringByReplacingMatches(in: self, options: NSRegularExpression.MatchingOptions(),
                                                                        range: NSRange(location: 0, length: self.count), withTemplate: stop)
            return modifiedString.components(separatedBy: stop)
        } catch {
            return []
        }
    }
    
    mutating func replaceRegex(pattern: String, template: String) {
        if let modifiedString: String = self.stringByReplacingRegex(pattern: pattern, template: template) {
            self = modifiedString
        }
    }
    
    func stringByReplacingRegex(pattern: String, template: String) -> String? {
        do {
            let regex: NSRegularExpression = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
            return regex.stringByReplacingMatches(in: self, options: NSRegularExpression.MatchingOptions(),
                                                  range: NSRange(location: 0, length: self.count), withTemplate: template)
        } catch {
            return nil
        }
    }
    
    func subString(regexPattern: String) -> String? {
        do {
            let regex: NSRegularExpression = try NSRegularExpression(pattern: regexPattern, options: .caseInsensitive)
            if let matchResult: NSTextCheckingResult = regex.firstMatch(in: self, options: .reportProgress, range: NSRange(location: 0, length: self.count)) {
                if matchResult.numberOfRanges > 0 {
                    return (self as NSString).substring(with: matchResult.range(at: 1))
                }
            }
            return nil
        } catch {
            return nil
        }
    }
    
    #if canImport(Foundation)
    
    #endif
    
    //    /// Trims white space and new line characters, returns a new string
    //    public func trimmed() -> String {
    //        return trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    //    }
    
    /// Trims all characters after the last occurence of a given substring
    func trimmingSubstringAfterLastOccurrence(of substring: String) -> String {
        guard let location = self.lastIndexOf(substring) else { return self }
        return self.subString(upToIndex: location.utf16Offset(in: self))
    }
    
    /// Checking if String contains input with comparing options
    func containsString(_ string: String, compareOptions: NSString.CompareOptions) -> Bool {
        return self.range(of: string, options: compareOptions) != nil
    }
    
    // MARK: Conversion
    
    /// Swiftest: NSNumber from a string.
    var nsNumber: NSNumber? {
        return NumberFormatter().number(from: self)
    }
    
    /// Swiftest: NSString from a string.
    var nsString: NSString {
        return NSString(string: self)
    }
    
    /// Returns the first index of the occurency of the character in String
    func getIndexOf(_ char: Character) -> Int? {
        return self.firstIndex(of: char)?.utf16Offset(in: self)
    }
}

// MARK: Path related Extensions
public extension String {
    
    func stringByAddingUrlProtocolPrefixIfNeeded(_ prefix: String = "https") -> String {
        
        if components(separatedBy: "//").count > 1 {
            return self
        }
        return "\(prefix)://\(self)"
        
    }
    
    func removingUrlPrefixes() -> String {
        guard let trimmedUrl = components(separatedBy: "//")[safe: 1] else {
            return removing(prefix: "www.")
        }
        return trimmedUrl.removing(prefix: "www.")
    }
    
    func removing(prefix: String) -> String {
        return replacingFirstOccurrence(of: prefix, with: "")
    }
    
    func replacingFirstOccurrence(of substring: String, with replacement: String) -> String {
        if let range = self.range(of: substring) {
            return self.replacingCharacters(in: range, with: replacement)
        }
        return self
    }
    func indexOf(_ input: String,
                        options: String.CompareOptions = .literal) -> String.Index? {
        return self.range(of: input, options: options)?.lowerBound
    }
    
    func lastIndexOf(_ input: String) -> String.Index? {
        return indexOf(input, options: .backwards)
    }
    
    func replacingLastOccurrenceOfString(_ searchString: String,
                                                with replacementString: String,
                                                caseInsensitive: Bool = true) -> String {
        let options: String.CompareOptions
        if caseInsensitive {
            options = [.backwards, .caseInsensitive]
        } else {
            options = [.backwards]
        }
        
        if let range = self.range(of: searchString,
                                  options: options,
                                  range: nil,
                                  locale: nil) {
            
            return self.replacingCharacters(in: range, with: replacementString)
        }
        return self
    }
}

extension Sequence where Iterator.Element == String {
    /// Checking if String contains input with comparing options
    public func containsString(_ string: String, compareOptions: NSString.CompareOptions) -> Bool {
        let match = self.contains(where: { (stringToCompare: String) -> Bool in
            return stringToCompare.containsString(string, compareOptions: compareOptions)
        })
        return match
    }
}
