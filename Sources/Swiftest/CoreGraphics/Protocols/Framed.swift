//
//  Frameable.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/27/18.
//

#if canImport(CoreGraphics)
import CoreGraphics

public protocol Framed: Sized {
    var origin: CGPoint { get set }
    var minX: CGFloat { get }
    var maxX: CGFloat { get }
    var midX: CGFloat { get }
    var minY: CGFloat { get }
    var maxY: CGFloat { get }
    var midY: CGFloat { get }

    var x: CGFloat { get set }
    var y: CGFloat { get set }
}
extension Framed {
    public var topLeft: CGPoint {
        return CGPoint(x: minX, y: minY)
    }

    public var topRight: CGPoint {
        return CGPoint(x: maxX, y: minY)
    }

    public var topCenter: CGPoint {
        return CGPoint(x: midX, y: minY)
    }

    public var bottomRight: CGPoint {
        return CGPoint(x: maxX, y: maxY)
    }

    public var bottomLeft: CGPoint {
        return CGPoint(x: minX, y: maxY)
    }

    public var bottomCenter: CGPoint {
        return CGPoint(x: midX, y: maxY)
    }

    public var x: CGFloat {
        get {
            return origin.x
        } set(value) {
            origin.x = value
        }
    }

    public var y: CGFloat {
        get {
            return origin.y
        } set(value) {
            origin.y = value
        }
    }

    public var center: CGPoint {
        return CGPoint(x: x + w/2, y: y + h/2)
    }
}

#endif
