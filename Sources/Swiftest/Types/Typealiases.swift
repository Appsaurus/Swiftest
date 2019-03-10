//
//  Typealiases.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/12/18.
//

import Foundation

public typealias ThrowingClosure<Input, Output> = (Input) throws -> Output
public typealias Closure<Input, Output> = (Input) -> Output
public typealias ClosureIn<Input> = (Input) -> Void
public typealias ClosureOut<Output> = () -> Output

public typealias VoidClosure = () -> Void
public typealias ErrorClosure = (Error) -> Void
public typealias OptionalErrorClosure = (Error?) -> Void

public typealias Predicate<X> = (X) -> Bool
public typealias ThrowingPredicate<X> = (X) throws -> Bool

public typealias AsyncThrowingClosure<Parameter, Return> = ((Parameter) throws -> Return) -> Void
