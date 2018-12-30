//
//  StyleOperator.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/29/18.
//

precedencegroup StyleOperatorPrecedence{
    associativity: right
    higherThan: MapOperatorPrecedence
}
infix operator ~: StyleOperatorPrecedence
