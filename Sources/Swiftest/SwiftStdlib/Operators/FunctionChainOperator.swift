//
//  FunctionChainOperator.swift
//  Pods
//
//  Created by Brian Strobach on 2/21/18.
//


/// Chains functions together like a pipe operator. The function on the rhs takes the outupt of the lhs function as input.
///	Example Usage:
///	public func run() throws {
///		try (object.function1 + object.function2 + object2.function1 + finalize)()
///	}

/// - Parameters:
///   - lhs: A function that returns the input for rhs
///   - rhs: A function that takes the return type for lhs as input
/// - Returns: A function that chains all the inputs together when called.
public func +<A, B, C>(lhs: @escaping (A) throws -> B,
						 rhs: @escaping (B) throws -> C) -> (A) throws -> C {
	return { try rhs(lhs($0)) }
}
