//
//  KeyPathValueMapOperator.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/30/18.
//

/// Overload of Custom MapOperator (=>). This usage maps a WritableKeyPath to a value to create a KeyPathValuePair.
///
/// - Parameters:
///   - lhs: A WritableKeyPath
///   - rhs: Value to be mapped to the WritableKeyPath
/// - Returns: A KeyPathValuePair that can be later applied to the supplied KeyPath with the supplied Value.
public func => <V, R, WKP: WritableKeyPath<R, V>> (lhs: WKP, rhs: @autoclosure () -> V) -> KeyPathValuePair<R> {
    return lhs.with(value: rhs())
}
