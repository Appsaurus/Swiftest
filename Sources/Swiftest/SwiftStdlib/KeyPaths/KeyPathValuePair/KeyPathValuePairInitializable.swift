//
//  KeyPathValuePairInitializable.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/27/18.
//

public protocol KeyPathValuePairInitializable: KeyPathValuePairAssignable {
    init() //Must implement no parameter initializer
}

extension KeyPathValuePairInitializable {

    /// Swiftest: Type-safe, memberwise initializer for all WritableKeyPaths.
    ///
    ///    let object = Object(\.id => 1,
    ///                        \.stringField => "String",
    ///                        \.optionalStringField => "Optional",
    ///                        \.intField => 2,
    ///                        \.doubleField => 2.0,
    ///                        \.booleanField => true)
    ///
    /// - Parameter keyPathValuePairs: KeyPathValuePairs to assign to object upon initialization.
    public init(_ keyPathValuePairs: KeyPathValuePair<Self>...) {
        self.init(keyPathValuePairs)
    }

    /// Swiftest: Type-safe, memberwise initializer for all WritableKeyPaths.
    ///
    ///    let object = Object([\.id => 1,
    ///                         \.stringField => "String",
    ///                         \.optionalStringField => "Optional",
    ///                         \.intField => 2,
    ///                         \.doubleField => 2.0,
    ///                         \.booleanField => true])
    ///
    /// - Parameter keyPathValuePairs: Array of KeyPathValuePairs to assign to object upon initialization.

    public init(_ keyPathValuePairs: KeyPathValuePairs<Self>) {
        self.init()
        self += keyPathValuePairs
    }
}
