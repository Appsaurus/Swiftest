//
//  ComparableExtensions.swift
//  Swiftest
//
//  Created by Brian Strobach on 5/4/18.
//

// Note: Comparison operators with optionals were removed from the Swift Standard Libary. Not sure if there is a better solution for this.
public func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
	switch (lhs, rhs) {
	case let (l?, r?):
		return l < r
	case (nil, _?):
		return true
	default:
		return false
	}
}
