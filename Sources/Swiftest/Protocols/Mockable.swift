//
//  Mockable.swift
//  Pods
//
//  Created by Brian Strobach on 7/11/17.
//
//

#if !os(watchOS)
	import Foundation
	public protocol Mockable {
		associatedtype ObjectType
		static func placeholderObjects(count: Int) -> [ObjectType]
		static func placeholderObject() -> ObjectType

	}
	extension Mockable {

		public static func placeholderObjects(count: Int) -> [ObjectType] {

			var placeholderObjects = [ObjectType]()
			for _ in 1...count {
				placeholderObjects.append(self.placeholderObject())

			}
			return placeholderObjects
		}

	}

	extension Mockable where ObjectType: Hashable {
		public static func placeholderObjectSet(count: Int) -> Set<ObjectType> {

			var set = Set<ObjectType>()
			for object in placeholderObjects(count: count) {
				set.insert(object)
			}
			return set
		}
	}

	public class MockableNetwork {
		public static func makeFakeNetworkCall(delay: Int = 3, chanceOfSuccess: Int = 100, success: @escaping VoidClosure, failure: @escaping VoidClosure) {
			DispatchQueue.main.asyncAfter(seconds: delay) {
                if Int.random(in: 1...100) > chanceOfSuccess {
					failure()
				} else {
					success()
				}
			}
		}

		public static func imageUrl(width: Int, height: Int) -> String {
			return "https://via.placeholder.com/\(width)x\(height)"
		}
	}

#endif
