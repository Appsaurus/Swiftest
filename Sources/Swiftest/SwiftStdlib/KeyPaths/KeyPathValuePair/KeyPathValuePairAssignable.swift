//
//  KeyPathValuePairAssignable.swift
//  Swiftest
//
//  Created by Brian Strobach on 11/13/18.
//

public protocol KeyPathValuePairAssignable {
    func assign(_ keyPathValuePairs: KeyPathValuePairs<Self>)
}

extension KeyPathValuePairAssignable {
    public func assign(_ keyPathValuePairs: KeyPathValuePairs<Self>) {
        for keyPathValuePair in keyPathValuePairs {
            keyPathValuePair.apply(to: self)
        }
    }
}
