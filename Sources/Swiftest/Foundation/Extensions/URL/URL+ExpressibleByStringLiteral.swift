//
//  URL+.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/17/18.
//
#if !os(Linux) && canImport(Foundation)
import Foundation

extension URL: @retroactive ExpressibleByStringLiteral {
    // By using 'StaticString' we disable string interpolation, for safety
    public init(stringLiteral value: StaticString) {
        guard let url = URL(string: "\(value)") else {
            fatalError("Invalid URL string literal: \(value)")
        }
        self = url
    }
    
}
#endif
