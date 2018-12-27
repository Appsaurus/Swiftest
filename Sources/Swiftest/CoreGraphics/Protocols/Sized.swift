//
//  Sized.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/27/18.
//

#if canImport(CoreGraphics)
import CoreGraphics

public protocol Sized {
    var width: CGFloat { get }
    var height: CGFloat { get }
    var size: CGSize { get set }

    var h: CGFloat { get set }
    var w: CGFloat { get set }
}

public enum AspectRatioType {
    case square, portrait, landscape
}

extension Sized {

    public var w: CGFloat {
        get {
            return width
        } set(value) {
            size.width = value
        }
    }

    public var h: CGFloat {
        get {
            return height
        } set(value) {
            size.height = value
        }
    }

    public var area: CGFloat {
        return w * h
    }

    public var diagonalLength: CGFloat {
        return sqrt(pow(w, 2) + pow(h, 2))
    }
    public var maxSideLength: CGFloat {
        return max(w, h)
    }

    public var minSideLength: CGFloat {
        return min(w, h)
    }
    
    public var aspectRatio: CGFloat {
        return w/h
    }

    public var aspectRatioHeightToWidth: CGFloat {
        return h/w
    }

    public var centerInOwnCoordinateSpace: CGPoint {
        return CGPoint(x: w / 2.0, y: h / 2.0)
    }

    public var aspectRatioType: AspectRatioType {
        switch aspectRatio {
        case 1.0: return .square
        case CGFloat.leastNormalMagnitude..<1.0: return .portrait
        default: return .landscape
        }
    }
}

#endif
