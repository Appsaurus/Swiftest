//
//  OptionalCustomOperators.swift
//  Servasaurus
//
//  Created by Brian Strobach on 12/4/17.
//


precedencegroup OptionalAssignment {
    associativity: right
}

infix operator =? : OptionalAssignment

//Overwrites variable's value IFF the new valeu is not nil.
public func =? <T>(variable: inout T, value: T?) {
    if let value = value {
        variable = value
    }
}

precedencegroup NilCoalescingAssignment {
    associativity: right
}

//Assigns a value to the variable only if variable is null at the time of assignment.
infix operator ??= : NilCoalescingAssignment

public func ??= <T>(variable: inout T?, value: @autoclosure () -> T?) {
    if variable == nil{
        variable = value()
    }
}
