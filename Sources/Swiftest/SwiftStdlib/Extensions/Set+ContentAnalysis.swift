//
//  SetExtensions.swift
//  Pods
//
//  Created by Brian Strobach on 4/27/18.
//

import Foundation

extension Set {
	public func contains(anyMemberOf set: Set<Element>) -> Bool {
		return self.intersection(set).count > 0
	}

	public func contains(allMembersOf set: Set<Element>) -> Bool {
		return self.intersection(set).hasIdenticalMembers(as: set)
	}

	public func hasIdenticalMembers(as set: Set<Element>) -> Bool {
		return self.isSubset(of: set) && set.isSubset(of: self)
	}
}
