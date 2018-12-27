//
//  Sequence+Iterating.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/12/18.
//

public extension Sequence {

    /// Swiftest: Iterate over a collection in reverse order. (right to left)
    ///
    ///        [0, 2, 4, 7].forEachReversed({ print($0)}) -> //Order of print: 7,4,2,0
    ///
    /// - Parameter body: a closure that takes an element of the array as a parameter.
    public func forEachReversed(_ body: (Element) throws -> Void) rethrows {
        try reversed().forEach(body)
    }
    
    /// Swiftest: Calls the given closure with each element where condition is true.
    ///
    ///        [0, 2, 4, 7].forEach(where: {$0 % 2 == 0}, body: { print($0)}) -> //print: 0, 2, 4
    ///
    /// - Parameters:
    ///   - condition: condition to evaluate each element against.
    ///   - body: a closure that takes an element of the array as a parameter.
    public func forEach(where condition: ThrowingPredicate<Element>, body: (Element) throws -> Void) rethrows {
        for element in self where try condition(element) {
            try body(element)
        }
    }
    
}

//  Allows you to call a method on each element of a sequence.
//  Instead of:
//  for view in views {
//      view.removeFromSuperview()
//  }
//  Do:
//  views.callOnEach(UIView.removeFromSuperview)
public typealias MethodOf<Class> = (Class) -> () -> Void

extension Sequence {
    public func callOnEach(_ method: MethodOf<Element>) {
        for element in self {
            // Get an instance method for the element by calling 'method'
            // and then run it directly using ().
            method(element)()
        }
    }
}

public func call<Input, Output>(_ function: (Input) -> Output, with input: Input) -> Output {
    return function(input)
}
