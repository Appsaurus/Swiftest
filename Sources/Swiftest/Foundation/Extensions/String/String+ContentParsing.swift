//
//  String+ContentParsing.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/18/18.
//

#if canImport(Foundation)
import Foundation

extension String {
    /// Swiftest: an array of all words in a string
    ///
    ///        "Swift is amazing".words() -> ["Swift", "is", "amazing"]
    ///
    /// - Returns: The words contained in a string.
    public func words() -> [String] {
        // https://stackoverflow.com/questions/42822838
        let chararacterSet = CharacterSet.whitespacesAndNewlines.union(.punctuationCharacters)
        let comps = components(separatedBy: chararacterSet)
        return comps.filter { !$0.isEmpty }
    }

    /// Swiftest: Array of strings separated by new lines.
    ///
    ///        "Hello\ntest".lines() -> ["Hello", "test"]
    ///
    /// - Returns: Strings separated by new lines.
    public func lines() -> [String] {
        var result = [String]()
        enumerateLines { line, _ in
            result.append(line)
        }
        return result
    }
    
    public func tokenize() -> [String] {
        let inputRange = fullIndexRange.toNSRange(self).cfRange
        let flag = UInt(kCFStringTokenizerUnitWord)
        let locale = CFLocaleCopyCurrent()
        let tokenizer = CFStringTokenizerCreate( kCFAllocatorDefault, self as CFString?, inputRange, flag, locale)
        var tokenType = CFStringTokenizerAdvanceToNextToken(tokenizer)
        var tokens: [String] = []
        
        while tokenType != CFStringTokenizerTokenType() {
            let currentTokenRange = CFStringTokenizerGetCurrentTokenRange(tokenizer)
            let substring = self.subString(currentTokenRange.nsRange)
            tokens.append(substring)
            tokenType = CFStringTokenizerAdvanceToNextToken(tokenizer)
        }
        
        return tokens
    }
    
    public func initials(_ count: Int? = nil) -> String {
        let words = self.tokenize()
        let intialsCount = count != nil ? min(count!, words.count) : words.count
        var initials = ""
        
        for word in words[0...intialsCount - 1] where !word.isEmpty {
            initials.append(word.first!)
        }
        
        return initials
    }
}

#endif
