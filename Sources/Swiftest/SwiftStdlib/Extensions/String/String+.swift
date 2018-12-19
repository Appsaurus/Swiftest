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
    
    public static func whitespace(count: Int = 1) -> String{
        return " ".repeated(count: count)
    }
    

}


public extension String {

    public func subString(upToIndex index: Int) -> String {
        return subString(0, length: index)
    }
    
    public func subString(_ start: Int, length: Int? = nil) -> String {
        if let length = length {
            //            if length > 0 {
            return String(self[String.Index(encodedOffset: start)..<String.Index(encodedOffset: start + length)])
            //            } else if length < 0 {
            //                return String(self[String.Index(encodedOffset: start)..<String.Index(encodedOffset: length)])
            //            }
        }
        return String(self[String.Index(encodedOffset: start)..<String.Index(encodedOffset: self.length)])
    }
    
    
    public func subString(_ range: NSRange) -> String {
        return subString(range.location, length: range.length)
    }
    
    
    
    public mutating func remove(substrings: String...){
        self = self.stringAfterReplacing(substrings: substrings, with: "")
    }
    
    public func stringAfterRemoving(substrings: String...) -> String{
        return stringAfterReplacing(substrings: substrings, with: "")
    }
    
    public func stringAfterReplacing(substrings: [String], with replacement: String) -> String{
        var copy = self
        for string in substrings{
            if let range = copy.range(of: string) {
                copy.replaceSubrange(range, with: replacement)
            }
        }
        return copy
    }
    
    
    //MARK: Regex
    public func regexSplit(_ pattern: String) -> [String] {
        do {
            let regex: NSRegularExpression = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
            let stop: String = "&උටෟ#ߤჀ"
            let modifiedString: String = regex.stringByReplacingMatches(in: self, options: NSRegularExpression.MatchingOptions(),
                                                                        range: NSMakeRange(0, self.count), withTemplate: stop)
            return modifiedString.components(separatedBy: stop)
        } catch {
            return []
        }
    }
    
    public mutating func replaceRegex(pattern: String, template: String){
        if let modifiedString: String = self.stringByReplacingRegex(pattern: pattern, template: template){
            self = modifiedString
        }
    }
    
    public func stringByReplacingRegex(pattern: String, template: String) -> String? {
        do {
            let regex: NSRegularExpression = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
            return regex.stringByReplacingMatches(in: self, options: NSRegularExpression.MatchingOptions(),
                                                  range: NSMakeRange(0, self.count), withTemplate: template)
        } catch {
            return nil
        }
    }
    
    public func subString(regexPattern: String) -> String? {
        do {
            let regex: NSRegularExpression = try NSRegularExpression(pattern: regexPattern, options: .caseInsensitive)
            if let matchResult: NSTextCheckingResult = regex.firstMatch(in: self, options: .reportProgress, range: NSMakeRange(0, self.count)){
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
    public func trimmingSubstringAfterLastOccurrence(of substring: String) -> String{
        guard let location = self.lastIndexOf(substring) else { return self }
        return self.subString(upToIndex: location.encodedOffset)
    }
    
    /// Checking if String contains input with comparing options
    public func containsString(_ string: String, compareOptions: NSString.CompareOptions) -> Bool {
        return self.range(of: string, options: compareOptions) != nil
    }
    
    //MARK: Conversion
    
    /// Swiftest: NSNumber from a string.
    public var nsNumber: NSNumber?{
        return NumberFormatter().number(from: self)
    }
    
    
    /// Swiftest: NSString from a string.
    public var nsString: NSString {
        return NSString(string: self)
    }
    
    /// Returns the first index of the occurency of the character in String
    public func getIndexOf(_ char: Character) -> Int? {
        return self.index(of: char)?.encodedOffset
    }
}



//MARK: Path related Extensions
public extension String {
    
    public func stringByAddingUrlProtocolPrefixIfNeeded(_ prefix: String = "https") -> String {
        
        if components(separatedBy: "//").count > 1 {
            return self
        }
        return "\(prefix)://\(self)"
        
    }

    
    public func removingUrlPrefixes() -> String{
        guard let trimmedUrl = components(separatedBy: "//")[safe: 1] else {
            return removing(prefix: "www.")
        }
        return trimmedUrl.removing(prefix: "www.")
    }
    
    public func removing(prefix: String) -> String{
        return replacingFirstOccurrence(of: prefix, with: "")
    }
    
    public func replacingFirstOccurrence(of substring: String, with replacement: String) -> String {
        if let range = self.range(of: substring) {
            return self.replacingCharacters(in: range, with: replacement)
        }
        return self
    }
    public func indexOf(_ input: String,
                        options: String.CompareOptions = .literal) -> String.Index? {
        return self.range(of: input, options: options)?.lowerBound
    }
    
    public func lastIndexOf(_ input: String) -> String.Index? {
        return indexOf(input, options: .backwards)
    }
    
    public func replacingLastOccurrenceOfString(_ searchString: String,
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

extension Sequence where Iterator.Element == String{
    /// Checking if String contains input with comparing options
    public func containsString(_ string: String, compareOptions: NSString.CompareOptions) -> Bool {
        let match = self.contains(where: { (stringToCompare:String) -> Bool in
            return stringToCompare.containsString(string, compareOptions: compareOptions)
        })
        return match
    }
}
