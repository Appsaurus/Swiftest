//
//  URLRequestExtensions.swift
//  Swiftest
//
//  Created by Brian Strobach on 9/5/17.
//  Copyright © 2018 Appsaurus
//

#if canImport(Foundation)
import Foundation

// MARK: - Initializers
public extension URLRequest {

    /// Swiftest: Create URLRequest from URL string.
    ///
    /// - Parameter urlString: URL string to initialize URL request from
    public init?(urlString: String) {
        guard let url = URL(string: urlString) else { return nil }
        self.init(url: url)
    }

}
#endif
