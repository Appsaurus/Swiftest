//
//  ClassNameReflectable.swift
//  Swiftest
//
//  Created by Brian Strobach on 5/4/18.
//

public protocol ClassNameReflectable {
	var className: String { get }
	static var className: String { get }
}

extension ClassNameReflectable {
	public var className: String {
		return type(of: self).className
	}

	static public var className: String {
		return "\(self)"
	}
}

#if canImport(Foundation)
import Foundation

extension NSObject: ClassNameReflectable {}
#endif
