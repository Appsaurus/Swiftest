//
//  Errors.swift
//  Pods
//
//  Created by Brian Strobach on 8/22/17.
//
//

import Foundation

public protocol BaseError: LocalizedError {
    associatedtype ErrorType: LocalizedError
    var type: ErrorType { get set }
    var customLocalizedDescription: String? { get set }
    init(_ type: ErrorType, _ customLocalizedDescription: String?)
}

extension BaseError {
    public var errorDescription: String? {
        return customLocalizedDescription ?? type.errorDescription
    }
}

open class GenericError<T: Error>: LocalizedError {

    public var error: T?
    open var customLocalizedDescription: String?

    public required init(_ error: T? = nil, _ customLocalizedDescription: String? = nil) {
        self.error = error
        self.customLocalizedDescription = customLocalizedDescription
    }

    public var errorDescription: String? {
        return customLocalizedDescription ?? error?.localizedDescription
    }
}

public enum BasicErrorType: LocalizedError {
    case error
    case unknown

    public var errorDescription: String? {
        switch self {
        case .error:
            return "An error occurred."
        case .unknown:
            return "An unknown error occurred."
        }
    }
}
open class BasicError: GenericError<BasicErrorType> {
    //Common types
    static public let unknown = BasicError(.unknown)
    static public let error = BasicError(.error)
}

extension Swift.Error {
    public func keyValueDescription() -> String {
        return DebugUtils.listOfPropertiesWithValues(of: self)
    }

    public func printDescription() {
        print(keyValueDescription())
    }
}
