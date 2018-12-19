//
//  EmptyInitializable.swift
//  Pods
//
//  Created by Brian Strobach on 4/9/18.
//

import Foundation
public protocol EmptyInitializable{
	init()
}

extension EmptyInitializable{
	public static func initArray(_ size: Int) -> [Self]{
		var items: [Self] = []
		size.times{
			items.append(self.init())
		}
		return items
	}
}
