//
//  FloatingPointExtensions.swift
//  Swiftest
//
//  Created by Brian Strobach on 7/23/17.
//  Copyright © 2018 Appsaurus
//

#if canImport(Foundation)
import Foundation
#endif

// MARK: - Properties
public extension FloatingPoint {    

    #if canImport(Foundation)
    /// Swiftest: Ceil of number.
    public var ceil: Self {
        return Foundation.ceil(self)
    }
    #endif

    /// Swiftest: Radian value of degree input.
    public var degreesToRadians: Self {
        return Self.pi * self / Self(180)
    }

    #if canImport(Foundation)
    /// Swiftest: Floor of number.
    public var floor: Self {
        return Foundation.floor(self)
    }
    #endif

    /// Swiftest: Degree value of radian input.
    public var radiansToDegrees: Self {
        return self * Self(180) / Self.pi
    }

}
