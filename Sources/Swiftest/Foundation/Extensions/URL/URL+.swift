//
//  URLExtensions.swift
//  Swiftest
//
//  Created by Brian Strobach on 03/02/2017.
//  Copyright © 2018 Appsaurus
//

#if canImport(Foundation)
import Foundation

// MARK: - Properties
public extension URL {

    /// Swiftest: Dictionary of the URL's query parameters
    @available(OSX 10.10, *)
    var queryParameters: [String: String]? {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: false), let queryItems = components.queryItems else { return nil }

        var items: [String: String] = [:]

        for queryItem in queryItems {
            items[queryItem.name] = queryItem.value
        }

        return items
    }

}

// MARK: - Methods
public extension URL {

    /// Swiftest: URL with appending query parameters.
    ///
    ///		let url = URL(string: "https://google.com")!
    ///		let param = ["q": "Swifter Swift"]
    ///		url.appendingQueryParameters(params) -> "https://google.com?q=Swifter%20Swift"
    ///
    /// - Parameter parameters: parameters dictionary.
    /// - Returns: URL with appending given query parameters.
    @available(OSX 10.10, *)
    func appendingQueryParameters(_ parameters: [String: String]) -> URL {
        var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: true)!
        var items = urlComponents.queryItems ?? []
        items += parameters.map({ URLQueryItem(name: $0, value: $1) })
        urlComponents.queryItems = items
        return urlComponents.url!
    }

    /// Swiftest: Append query parameters to URL.
    ///
    ///		var url = URL(string: "https://google.com")!
    ///		let param = ["q": "Swifter Swift"]
    ///		url.appendQueryParameters(params)
    ///		print(url) // prints "https://google.com?q=Swifter%20Swift"
    ///
    /// - Parameter parameters: parameters dictionary.
    @available(OSX 10.10, *)
    mutating func appendQueryParameters(_ parameters: [String: String]) {
        self = appendingQueryParameters(parameters)
    }

    /// Swiftest: Get value of a query key.
    ///
    ///    var url = URL(string: "https://google.com?code=12345")!
    ///    queryValue(for: "code") -> "12345"
    ///
    /// - Parameter key: The key of a query value.
    @available(OSX 10.10, *)
    func queryValue(for key: String) -> String? {
        let stringURL = absoluteString
        guard let items = URLComponents(string: stringURL)?.queryItems else { return nil }
        for item in items where item.name == key {
            return item.value
        }
        return nil
    }

    /// Swiftest: Returns a new URL by removing all the path components.
    ///
    ///     let url = URL(string: "https://domain.com/path/other")!
    ///     print(url.deletingAllPathComponents()) // prints "https://domain.com/"
    ///
    /// - Returns: URL with all path components removed.
    func deletingAllPathComponents() -> URL {
        var url: URL = self
        for _ in 0..<pathComponents.count - 1 {
            url.deleteLastPathComponent()
        }
        return url
    }

    /// Swiftest: Remove all the path components from the URL.
    ///
    ///        var url = URL(string: "https://domain.com/path/other")!
    ///        url.deleteAllPathComponents()
    ///        print(url) // prints "https://domain.com/"
    mutating func deleteAllPathComponents() {
        for _ in 0..<pathComponents.count - 1 {
            deleteLastPathComponent()
        }
    }

    /// Swiftest: Generates new URL that does not have scheme.
    ///
    ///        let url = URL(string: "https://domain.com")!
    ///        print(url.droppedScheme()) // prints "domain.com"
    func droppedScheme() -> URL? {
        if let scheme = scheme {
            let droppedScheme = String(absoluteString.dropFirst(scheme.count + 3))
            return URL(string: droppedScheme)
        }

        guard host != nil else { return self }

        let droppedScheme = String(absoluteString.dropFirst(2))
        return URL(string: droppedScheme)
    }

}

public enum URLConvertibleError: Error {
    case invalidURL
}

public protocol URLConvertible {
    var toURL: URL? { get }
    func assertURL() throws -> URL
}

public extension URLConvertible {
    func assertURL() throws -> URL {
        guard let url = toURL else {
            throw URLConvertibleError.invalidURL
        }
        return url
    }

    func assertURL(prefixingSchemeIfNeeded scheme: String) throws -> URL {
        return try assertURL()
            .absoluteString
            .stringByAddingUrlProtocolPrefixIfNeeded(scheme)
            .assertURL()
    }

    func assertURLPrefixingHTTPSchemeIfNeeded() throws -> URL {
        return try assertURL(prefixingSchemeIfNeeded: "http")
    }
}

extension URL: URLConvertible {
    public var toURL: URL? {
        return self
    }
}

extension URLComponents: URLConvertible {
    public var toURL: URL? {
        return url
    }
}

extension String: URLConvertible {
    public var toURL: URL? {
        if let string = addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            return URL(string: string)
        }
        return URL(string: self)
    }
}

#endif
