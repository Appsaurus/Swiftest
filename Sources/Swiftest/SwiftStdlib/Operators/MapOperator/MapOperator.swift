//
//  MapOperator.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/30/18.
//

precedencegroup MapOperatorPrecedence {
    associativity: right
    higherThan: AdditionPrecedence
}

infix operator => : MapOperatorPrecedence
