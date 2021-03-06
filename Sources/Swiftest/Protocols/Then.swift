//
//  Then.swift
//  Swiftest
//
//  Created by Brian Strobach on 7/6/17.
//
//  Original implementation: https://github.com/devxoul/Then/blob/master/Sources/Then/Then.swift

public protocol Then {}

extension Then where Self: Any {
    
    /// Makes it available to set properties with closures just after initializing.
    ///
    ///     let frame = CGRect().with {
    ///       $0.origin.x = 10
    ///       $0.size.width = 100
    ///     }
    public func with(_ block: (inout Self) -> Void) -> Self {
        var copy = self
        block(&copy)
        return copy
    }
    
    /// Makes it available to execute something with closures.
    ///
    ///     UserDefaults.standard.do {
    ///       $0.set("devxoul", forKey: "username")
    ///       $0.set("devxoul@gmail.com", forKey: "email")
    ///       $0.synchronize()
    ///     }
    public func `do`(_ block: (Self) -> Void) {
        block(self)
    }
    
}

extension Then where Self: AnyObject {
    
    /// Makes it available to set properties with closures just after initializing.
    ///
    ///     let label = UILabel().then {
    ///       $0.textAlignment = .Center
    ///       $0.textColor = UIColor.blackColor()
    ///       $0.text = "Hello, World!"
    ///     }
    public func then(_ block: (Self) -> Void) -> Self {
        block(self)
        return self
    }
    
}

#if canImport(ObjectiveC)
import ObjectiveC
extension NSObject: Then {}
#endif

import Foundation

#if canImport(CoreGraphics)
import CoreGraphics

extension CGPoint: Then {}
extension CGRect: Then {}
extension CGSize: Then {}
extension CGVector: Then {}

#endif

#if canImport(UIKit)
import UIKit
extension UIEdgeInsets: Then {}
extension UIOffset: Then {}
extension UIRectEdge: Then {}
#endif
