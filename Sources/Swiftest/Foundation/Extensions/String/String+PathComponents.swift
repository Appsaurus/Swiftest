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
    public var lastPathComponent: String {
        return nsString.lastPathComponent
    }
    
    /// Swiftest: NSString pathExtension.
    public var pathExtension: String {
        return nsString.pathExtension
    }
    
    /// Swiftest: NSString deletingLastPathComponent.
    public var deletingLastPathComponent: String {
        return nsString.deletingLastPathComponent
    }
    
    /// Swiftest: NSString deletingPathExtension.
    public var deletingPathExtension: String {
        return nsString.deletingPathExtension
    }
    
    /// Swiftest: NSString pathComponents.
    public var pathComponents: [String] {
        return nsString.pathComponents
    }
    
    /// Swiftest: NSString appendingPathComponent(str: String)
    ///
    /// - Parameter str: the path component to append to the receiver.
    /// - Returns: a new string made by appending aString to the receiver, preceded if necessary by a path separator.
    public func appendingPathComponent(_ str: String) -> String {
        return nsString.appendingPathComponent(str)
    }
    
    public func appendingPathComponents(_ paths: [String]) -> String {
        var st = self
        paths.forEach {st = st.appendingPathComponent($0)}
        return st
    }
    
    /// Swiftest: NSString appendingPathExtension(str: String)
    ///
    /// - Parameter str: The extension to append to the receiver.
    /// - Returns: a new string made by appending to the receiver an extension separator followed by ext (if applicable).
    public func appendingPathExtension(_ str: String) -> String? {
        return nsString.appendingPathExtension(str)
    }
    
}
#endif
