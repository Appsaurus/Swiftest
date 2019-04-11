//
//  String+PathComponents.swift
//  SwiftTestUtils
//
//  Created by Brian Strobach on 12/14/18.
//

#if canImport(Foundation)
import Foundation

// MARK: - NSString extensions
public extension String {
    
    /// Swiftest: NSString lastPathComponent.
    var lastPathComponent: String {
        return nsString.lastPathComponent
    }
    
    /// Swiftest: NSString pathExtension.
    var pathExtension: String {
        return nsString.pathExtension
    }
    
    /// Swiftest: NSString deletingLastPathComponent.
    var deletingLastPathComponent: String {
        return nsString.deletingLastPathComponent
    }
    
    /// Swiftest: NSString deletingPathExtension.
    var deletingPathExtension: String {
        return nsString.deletingPathExtension
    }
    
    /// Swiftest: NSString pathComponents.
    var pathComponents: [String] {
        return nsString.pathComponents
    }
    
    /// Swiftest: NSString appendingPathComponent(str: String)
    ///
    /// - Parameter str: the path component to append to the receiver.
    /// - Returns: a new string made by appending aString to the receiver, preceded if necessary by a path separator.
    func appendingPathComponent(_ str: String) -> String {
        return nsString.appendingPathComponent(str)
    }
    
    func appendingPathComponents(_ paths: [String]) -> String {
        var st = self
        paths.forEach {st = st.appendingPathComponent($0)}
        return st
    }
    
    /// Swiftest: NSString appendingPathExtension(str: String)
    ///
    /// - Parameter str: The extension to append to the receiver.
    /// - Returns: a new string made by appending to the receiver an extension separator followed by ext (if applicable).
    func appendingPathExtension(_ str: String) -> String? {
        return nsString.appendingPathExtension(str)
    }
    
}
#endif
