//
//  LocalExtensions.swift
//  Swiftest
//
//  Created by Brian Strobach on 4/19/17.
//  Copyright © 2018 Appsaurus
//

#if canImport(Foundation)
import Foundation

// MARK: - Properties
public extension Locale {

    /// Swiftest: UNIX representation of locale usually used for normalizing.
    static var posix: Locale {
        return Locale(identifier: "en_US_POSIX")
    }

}
#endif
