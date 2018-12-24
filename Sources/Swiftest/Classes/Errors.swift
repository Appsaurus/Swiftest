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
	public var localizedDescription: String {
		return customLocalizedDescription ?? type.localizedDescription
	}
}

open class GenericError<T: LocalizedError>: BaseError {

	public typealias ErrorType = T
	public var type: T
	open var customLocalizedDescription: String?

	public required init(_ type: T, _ customLocalizedDescription: String? = nil) {
		self.type = type
		self.customLocalizedDescription = customLocalizedDescription
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
