//
//  OptionalProtocol.swift
//  Servasaurus
//
//  Created by Brian Strobach on 12/5/17.
//

import Foundation

//Workaround for swift's lack of covariance and contravariance on Optional type
//Allows for check like '<type> is OptionalProtocol' or 'isOptional(instance)
public protocol OptionalProtocol {}

extension Optional: OptionalProtocol {}

public func isOptional(_ instance: Any) -> Bool {
	return instance is OptionalProtocol
}
