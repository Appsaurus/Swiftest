//
//  DebugUtils.swift
//  Pods
//
//  Created by Brian Strobach on 2/12/18.
//

import Foundation

open class DebugUtils{
	static public func listOfPropertiesWithValues(of object: Any) -> String{
		var object: Any = object
		var desc = "\(String(describing: object)) at address \(address(of: &object)):\n"
		let mirror = Mirror(reflecting: object)
		desc.append(listOfPropertiesWithValues(of: mirror))
		return desc
	}

	static public  func listOfPropertiesWithValues(of mirror: Mirror) -> String{
		var desc = ""
		if let superMirror = mirror.superclassMirror {
			desc.append(self.listOfPropertiesWithValues(of: superMirror))
		}


		for child in mirror.children {
			if let propertyName = child.label {
				desc.append("\t\(propertyName) = \(child.value)\n")
			}
		}
		return desc
	}
	static public  func printPropertiesWithValues<T: AnyObject>(of object: T){
		print(listOfPropertiesWithValues(of: object))
	}
}

public func address(of pointer: UnsafeRawPointer) -> Int {
	return Int(bitPattern: pointer)
}

public func address<T: AnyObject>(of object: T) -> Int {
	return unsafeBitCast(object, to: Int.self)
}


public protocol DebugLoggable{

}

extension DebugLoggable{
	public func keyValueDescription() -> String{
		return DebugUtils.listOfPropertiesWithValues(of: self)
	}

	public func printDescription(){
		print(keyValueDescription())
	}
}
