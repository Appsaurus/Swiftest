//
//  KeyPathValuePairAssignable.swift
//  Swiftest
//
//  Created by Brian Strobach on 11/13/18.
//

public protocol KeyPathValuePairAssignable: AnyObject{
    func assign(_ keyPathValuePairs: KeyPathValuePairs<Self>) -> Self
}

extension KeyPathValuePairAssignable {
    @discardableResult
    public func assign(_ keyPathValuePairs: KeyPathValuePairs<Self>) -> Self {
        for keyPathValuePair in keyPathValuePairs {
            keyPathValuePair.apply(to: self)
        }
        return self
    }
}
