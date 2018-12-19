//
//  RandomExtensions.swift
//  Swiftest
//
//  Created by Brian Strobach on 1/13/17.
//  Copyright © 2018 Appsaurus
//

import Foundation

public protocol Countable: Comparable{
    static var max: Self { get }
    static var min: Self { get }
}
extension Countable where Self: FloatingPoint{
    public static var min: Self{
        return 0
    }
    
    public static var max: Self{
        return greatestFiniteMagnitude
    }
}

public protocol RangeRandomizable: Countable{
    static func random(_ min: Self, _ max: Self, inclusive: Bool) -> Self
    static func random(in range: Range<Self>) -> Self
    static func random(in range: ClosedRange<Self>) -> Self
}

extension RangeRandomizable{
    //Range must be finite, and random(in:) considers the range -greatesFiniteMagnitude...greatestFiniteMagnitude to be infinite for some reason.
    //So a range of 0...greatestFiniteMagnitude is used for default. Must negate at callsite if desired.
    public static func random(_ min: Self = Self.min, _ max: Self = Self.max, inclusive: Bool = true) -> Self {
        guard inclusive else{
            return Self.random(in: min..<max)
        }
        return Self.random(in: min...max)
    }
    
    public static var random: Self {
        return random()
    }
}
extension Int: RangeRandomizable{}
extension Int8: RangeRandomizable{}
extension Int16: RangeRandomizable{}
extension Int32: RangeRandomizable{}
extension Int64: RangeRandomizable{}

extension UInt: RangeRandomizable{}
extension UInt8: RangeRandomizable{}
extension UInt16: RangeRandomizable{}
extension UInt32: RangeRandomizable{}
extension UInt64: RangeRandomizable{}

extension Double: RangeRandomizable{}

extension Float: RangeRandomizable{}

extension ClosedRange where Bound: RangeRandomizable{
    public var random: Bound {
        return Bound.random(in: self)
    }
}

public extension Bool {
    public static func random(chanceTrue: DoubleConvertible = 50.0) -> Bool {
        return (0.0...100.0).random < chanceTrue.double
    }
}


extension Date: RangeRandomizable{
    public static var max: Date {
        return Date(timeIntervalSince1970: TimeInterval.max)
    }
    
    public static var min: Date {
        return Date(timeIntervalSince1970: TimeInterval.min)
    }
    
    /// Swiftest: Returns a random date within the specified, exclusive range (upper bound is excluded).
    ///
    /// - Parameter range: The range in which to create a random date. `range` must not be empty.
    /// - Returns: A random date within the exclusive bounds of `range`.
    public static func random(in range: Range<Date>) -> Date {
        return Date(timeIntervalSinceReferenceDate:
            TimeInterval.random(in: range.lowerBound.timeIntervalSinceReferenceDate..<range.upperBound.timeIntervalSinceReferenceDate))
    }
    
    /// Swiftest: Returns a random date within the specified inclusive range.
    ///
    /// - Parameter range: The range in which to create a random date.
    /// - Returns: A random date within the inclusive bounds of an `range`.
    public static func random(in range: ClosedRange<Date>) -> Date {
        return Date(timeIntervalSinceReferenceDate:
            TimeInterval.random(in: range.lowerBound.timeIntervalSinceReferenceDate...range.upperBound.timeIntervalSinceReferenceDate))
    }
    
    /// Swiftest: Returns a random date within the specified range, using the given generator as a source for randomness.
    ///
    /// - Parameters:
    ///   - range: The range in which to create a random date. `range` must not be empty.
    ///   - generator: The random number generator to use when creating the new random date.
    /// - Returns: A random date within the bounds of `range`.
    public static func random<T>(in range: Range<Date>, using generator: inout T) -> Date where T: RandomNumberGenerator {
        return Date(timeIntervalSinceReferenceDate:
            TimeInterval.random(in: range.lowerBound.timeIntervalSinceReferenceDate..<range.upperBound.timeIntervalSinceReferenceDate,
                                using: &generator))
    }
    
    /// Swiftest: Returns a random date within the specified range, using the given generator as a source for randomness.
    ///
    /// - Parameters:
    ///   - range: The range in which to create a random date.
    ///   - generator: The random number generator to use when creating the new random date.
    /// - Returns: A random date within the bounds of `range`.
    public static func random<T>(in range: ClosedRange<Date>, using generator: inout T) -> Date where T: RandomNumberGenerator {
        return Date(timeIntervalSinceReferenceDate:
            TimeInterval.random(in: range.lowerBound.timeIntervalSinceReferenceDate...range.upperBound.timeIntervalSinceReferenceDate,
                                using: &generator))
    }
}

public extension Date {
    public static func randomWithin(_ interval: TimeInterval,
                                    from date: Date = Date()) -> Date {
        
        let furthest = date.addingTimeInterval(interval)
        let ordered = [date, furthest].sorted()
        guard let lowerBound = ordered.first, let upperBound = ordered.last else{
            return (date...furthest).random
        }
        return (lowerBound...upperBound).random
    }
}


#if canImport(CoreGraphics)
import CoreGraphics

//Not sure why this is required since CGFloat implements FoatingPoint,
//but compiler can't resolve min/max from default protocol implementation

extension CGFloat: RangeRandomizable{
    public static var min: CGFloat{
        return 0
    }
    
    public static var max: CGFloat{
        return greatestFiniteMagnitude
    }
}

extension CGRect{
    public func randomPointInside() -> CGPoint{
        return CGPoint(x: .random(origin.x, maxX), y: .random(origin.y, maxY))
    }
    
    public func randomFrameInside(frameSize: CGSize) -> CGRect{
        
        assert(frameSize.w <= self.w && frameSize.h <= self.h, "Subframe is larger than parent frame")
        
        let halfWidth = frameSize.w / 2.0
        let halfHeight = frameSize.h / 2.0
        let inset = self.insetBy(dx: halfWidth, dy: halfHeight)
        let center = inset.randomPointInside()
        return CGRect(origin: center - CGPoint(x: halfWidth, y: halfHeight), size: frameSize)
        
    }
}

extension CGSize{
    public static func randomSize(widthRange: ClosedRange<CGFloat>, heightRange: ClosedRange<CGFloat>) -> CGSize{
        return CGSize(width: widthRange.random, height: heightRange.random)
    }
}
#endif
