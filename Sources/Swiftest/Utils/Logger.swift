//
//  Logger.swift
//  Pods
//
//  Created by Brian Strobach on 2/21/18.
//

import Foundation
//import os.log

//TODO: Create are real local and remote logger
public func debugLog(_ object: Any, file: String = #file, function: String = #function, line: Int = #line, column: Int = #column) {
	#if DEBUG
		print("\n\(SourceCodeLocation(file: file, function: function, line: line, column: column))\n\n\(object))\n\n")
	#endif
}

public func debugLog(_ error: Error, file: String = #file, function: String = #function, line: Int = #line, column: Int = #column) {
	#if DEBUG
		print("\n\(SourceCodeLocation(file: file, function: function, line: line, column: column))\n\n\(error.keyValueDescription())\n\n")
	#endif
}



public struct SourceCodeLocation: CustomDebugStringConvertible{
	public var file: String
	public var function: String
	public var line: Int
	public var column: Int
	public init(file: String, function: String, line: Int , column: Int) {
		self.file = file
		self.function = function
		self.line = line
		self.column = column
	}

	public static func here(file: String = #file, function: String = #function, line: Int = #line, column: Int = #column) -> SourceCodeLocation{
		return SourceCodeLocation(file: file, function: function, line: line, column: column)
	}

	public var debugDescription: String{
		let className = file.lastPathComponent
		return "[\(className): line #\(line) column # \(column)] in \(function)"
	}
}
