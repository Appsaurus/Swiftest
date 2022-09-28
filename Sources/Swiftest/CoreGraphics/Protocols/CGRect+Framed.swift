//
//  CGRect+Framed.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/27/18.
//

#if canImport(CoreGraphics)
import CoreGraphics
extension CGRect: Framed {
    public var w: CGFloat {
        get {
            return width
        } set(value) {
            self = CGRect(x: x, y: y, width: value, height: h)
        }
    }

    public var h: CGFloat {
        get {            
            return height
        } set(value) {
            self = CGRect(x: x, y: y, width: w, height: value)
        }
    }
    
    public var origin: CGPoint {
        get {
            .zero
        }
        set(newValue) {
            // Not mutable
        }
    }
    
    public var minX: CGFloat {
        0
    }
    
    public var maxX: CGFloat {
        width
    }
    
    public var midX: CGFloat {
        width / 2.0
    }
    
    public var minY: CGFloat {
        0
    }
    
    public var maxY: CGFloat {
        height
    }
    
    public var midY: CGFloat {
        height / 2.0
    }
}
#endif
