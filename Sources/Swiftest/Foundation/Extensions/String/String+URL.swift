//
//  String+URL.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/17/18.
//

#if canImport(Foundation)
import Foundation

extension String {
    
    /// Swiftest: URL from string (if applicable).
    ///
    ///        "https://google.com".url -> URL(string: "https://google.com")
    ///        "not url".url -> nil
    ///
    public var url: URL? {
        // Only create URL if string contains a scheme to prevent automatic encoding of invalid URLs
        guard self.contains("://") else { return nil }
        return URL(string: self)
    }
    
    /// Swiftest: Check if string is a valid URL.
    ///
    ///        "https://google.com".isValidUrl -> true
    ///
    public var isValidUrl: Bool {
        return URL(string: self) != nil
    }
    
    /// Swiftest: Check if string is a valid schemed URL.
    ///
    ///        "https://google.com".isValidSchemedUrl -> true
    ///        "google.com".isValidSchemedUrl -> false
    ///
    public var isValidSchemedUrl: Bool {
        guard let url = URL(string: self) else { return false }
        return url.scheme != nil
    }
    
    /// Swiftest: Check if string is a valid https URL.
    ///
    ///        "https://google.com".isValidHttpsUrl -> true
    ///
    public var isValidHttpsUrl: Bool {
        guard let url = URL(string: self) else { return false }
        return url.scheme == "https"
    }
    
    /// Swiftest: Check if string is a valid http URL.
    ///
    ///        "http://google.com".isValidHttpUrl -> true
    ///
    public var isValidHttpUrl: Bool {
        guard let url = URL(string: self) else { return false }
        return url.scheme == "http"
    }
    
    /// Swiftest: Check if string is a valid file URL.
    ///
    ///        "file://Documents/file.txt".isValidFileUrl -> true
    ///
    public var isValidFileUrl: Bool {
        return URL(string: self)?.isFileURL ?? false
    }
    
    /// Swiftest: Transforms the string into a slug string.
    ///
    ///        "Swift is amazing".toSlug() -> "swift-is-amazing"
    ///
    /// - Returns: The string in slug format.
    public func toSlug() -> String {
        let lowercased = self.lowercased()
        let latinized = lowercased.latinized
        let withDashes = latinized.replacingOccurrences(of: " ", with: "-")
        
        var filtered = withDashes.filter {
            guard String($0) != "-" else { return true }
            guard String($0) != "&" else { return true }
            return String($0).rangeOfCharacter(from: . alphanumerics) != nil
        }
        
        while filtered.lastCharacterAsString == "-" {
            filtered = String(filtered.dropLast())
        }
        
        while filtered.firstCharacterAsString == "-" {
            filtered = String(filtered.dropFirst())
        }
        
        return filtered.replacingOccurrences(of: "--", with: "-")
    }

    #if !os(Linux)
    /// Extracts URLS from String
    public func extractURLs() throws -> [URL] {
        var urls: [URL] = []
        let detector: NSDataDetector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        let text: String = self
        //swiftlint:disable:next line_length
        detector.enumerateMatches(in: text, options: [], range: NSRange(location: 0, length: text.count), using: { (result: NSTextCheckingResult?, _: NSRegularExpression.MatchingFlags, _: UnsafeMutablePointer<ObjCBool>) -> Void in
            if let result = result,
                let url = result.url {
                urls.append(url)
            }
        })
        return urls
    }
    #endif
}

// MARK: Encoding/Decoding

extension String {
    
    /// Swiftest: URL escaped string.
    ///
    ///        "it's easy to encode strings".urlEncoded -> "it's%20easy%20to%20encode%20strings"
    ///
    public var urlEncoded: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    /// Swiftest: Escape string.
    ///
    ///        var str = "it's easy to encode strings"
    ///        str.urlEncode()
    ///        print(str) // prints "it's%20easy%20to%20encode%20strings"
    ///
    public mutating func urlEncode() {
        if let encoded = addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            self = encoded
        }
    }
    
    /// Swiftest: Readable string from a URL string.
    ///
    ///        "it's%20easy%20to%20decode%20strings".urlDecoded -> "it's easy to decode strings"
    ///
    public var urlDecoded: String {
        return removingPercentEncoding ?? self
    }
    
    /// Swiftest: Convert URL string to readable string.
    ///
    ///        var str = "it's%20easy%20to%20decode%20strings"
    ///        str.urlDecode()
    ///        print(str) // prints "it's easy to decode strings"
    ///
    public mutating func urlDecode() {
        if let decoded = removingPercentEncoding {
            self = decoded
        }
    }
}
#endif
