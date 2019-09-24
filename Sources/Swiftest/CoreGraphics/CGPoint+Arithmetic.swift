//
//  CGPointExtensions.swift
//  Swiftest
//
//  Created by Brian Strobach on 6/8/16.
//  Copyright © 2018 Appsaurus
//

#if canImport(CoreGraphics)
import CoreGraphics
    public extension CGPoint {
        static func distanceBetween(p1: CGPoint, p2: CGPoint) -> CGFloat {
            let distance: CGFloat = CGFloat(hypotf(Float(p1.x) - Float(p2.x), Float(p1.y) - Float(p2.y)))
            return distance
        }

        @discardableResult
        mutating func offsetX(byDistance distance: CGFloat) -> CGPoint{
            self += CGPoint(x: distance, y: 0.0)
            return self
        }

        @discardableResult
        mutating func offsetY(byDistance distance: CGFloat) -> CGPoint{
            self += CGPoint(x: 0.0, y: distance)
            return self
        }

        @discardableResult
        mutating func offsetByPoint(_ offset: CGPoint) -> CGPoint {
            self += offset
            return self
        }
        
        var negated: CGPoint {
            return CGPoint(x: -self.x, y: -self.y)
        }

        static func midPoint(_ p1: CGPoint, _ p2: CGPoint) -> CGPoint {
            return CGPoint(x: (p1.x + p2.x) / 2.0,
                           y: (p1.y + p2.y) / 2.0)
        }

    }
    
    public func += (point: inout CGPoint, right: CGFloat) {
        point.x += right
        point.y += right
    }
    public func -= (point: inout CGPoint, right: CGFloat) {
        point.x -= right
        point.y -= right
    }
    public func *= (point: inout CGPoint, right: CGFloat) {
        point.x *= right
        point.y *= right
    }
    public func /= (point: inout CGPoint, right: CGFloat) {
        point.x /= right
        point.y /= right
    }
    
    public func += (left: inout CGPoint, right: CGPoint) {
        left.x += right.x
        left.y += right.y
    }
    public func -= (left: inout CGPoint, right: CGPoint) {
        left.x -= right.x
        left.y -= right.y
    }
    public func *= (left: inout CGPoint, right: CGPoint) {
        left.x *= right.x
        left.y *= right.y
    }
    public func /= (left: inout CGPoint, right: CGPoint) {
        left.x /= right.x
        left.y /= right.y
    }
    
    public func + (point: CGPoint, right: CGFloat) -> CGPoint {
        return CGPoint(x: point.x + right, y: point.y + right)
    }
    public func - (point: CGPoint, right: CGFloat) -> CGPoint {
        return CGPoint(x: point.x - right, y: point.y - right)
    }
    public func * (point: CGPoint, right: CGFloat) -> CGPoint {
        return CGPoint(x: point.x * right, y: point.y * right)
    }
    public func / (point: CGPoint, right: CGFloat) -> CGPoint {
        return CGPoint(x: point.x / right, y: point.y / right)
    }
    
    public func + (left: CGPoint, right: CGPoint) -> CGPoint {
        return CGPoint(x: left.x + right.x, y: left.y + right.y)
    }
    public func - (left: CGPoint, right: CGPoint) -> CGPoint {
        return CGPoint(x: left.x - right.x, y: left.y - right.y)
    }
    public func * (left: CGPoint, right: CGPoint) -> CGPoint {
        return CGPoint(x: left.x * right.x, y: left.y * right.y)
    }
    public func / (left: CGPoint, right: CGPoint) -> CGPoint {
        return CGPoint(x: left.x / right.x, y: left.y / right.y)
    }

#endif
