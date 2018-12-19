//
//  ThreadingUtils.swift
//  Swiftest
//
//  Created by Brian Strobach on 5/4/18.
//

import Foundation


/// Runs a lenghty synchronous function on a background thread, returning its value on the main thread in a closure.
///
/// - Parameters:
///   - function: The synchronous function.
///   - completion: The closure to be called on the main thread when the function completes.
public func completeOnMainThread<R: Any>(_ function: @autoclosure @escaping () -> R, _ completion: @escaping (R) -> Void){
	DispatchQueue.global().async {
		let result = function()
		DispatchQueue.main.async {
			completion(result)
		}
	}
}
