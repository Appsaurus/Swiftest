//
//  Optional+.swift
//  Swiftest
//
//  Created by Brian Strobach on 3/3/17.
//  Copyright © 2018 Appsaurus
//

// MARK: - Methods
public extension Optional {

    /// Swiftest: Get self of default value (if self is nil).
    ///
    ///		let foo: String? = nil
    ///		print(foo.unwrapped(or: "bar")) -> "bar"
    ///
    ///		let bar: String? = "bar"
    ///		print(bar.unwrapped(or: "foo")) -> "bar"
    ///
    /// - Parameter defaultValue: default value to return if self is nil.
    /// - Returns: self if not nil or default value if nil.
    public func unwrapped(or defaultValue: Wrapped) -> Wrapped {
        // http://www.russbishop.net/improving-optionals
        return self ?? defaultValue
    }

    /// Swiftest: Gets the wrapped value of an optional. If the optional is `nil`, throw a custom error.
    ///
    ///        let foo: String? = nil
    ///        try print(foo.unwrapped(or: MyError.notFound)) -> error: MyError.notFound
    ///
    ///        let bar: String? = "bar"
    ///        try print(bar.unwrapped(or: MyError.notFound)) -> "bar"
    ///
    /// - Parameter error: The error to throw if the optional is `nil`.
    /// - Returns: The value wrapped by the optional.
    /// - Throws: The error passed in.
    public func unwrapped(or error: Error) throws -> Wrapped {
        guard let wrapped = self else { throw error }
        return wrapped
    }

    /// Swiftest: Runs a block to Wrapped if not nil
    ///
    ///		let foo: String? = nil
    ///		foo.run { unwrappedFoo in
    ///			// block will never run sice foo is nill
    ///			print(unwrappedFoo)
    ///		}
    ///
    ///		let bar: String? = "bar"
    ///		bar.run { unwrappedBar in
    ///			// block will run sice bar is not nill
    ///			print(unwrappedBar) -> "bar"
    ///		}
    ///
    /// - Parameter block: a block to run if self is not nil.
    public func run(_ block: (Wrapped) -> Void) {
        // http://www.russbishop.net/improving-optionals
        _ = map(block)
    }

}

// MARK: Removing nils
public protocol OptionalType {
    associatedtype Wrapped
    func map<U>(_ f: (Wrapped) throws -> U) rethrows -> U?
}

extension Optional: OptionalType {}

public extension Sequence where Iterator.Element: OptionalType {
    public func removeNils() -> [Iterator.Element.Wrapped] {
        var result: [Iterator.Element.Wrapped] = []
        for element in self {
            if let element = element.map({ $0 }) {
                result.append(element)
            }
        }
        return result
    }
}
