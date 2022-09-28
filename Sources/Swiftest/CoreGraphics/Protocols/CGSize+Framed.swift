
//
//  CGSize+Framed.swift
//  Swiftest
//
//  Created by Brian Strobach on 9/13/22.
//


#if canImport(CoreGraphics)
import CoreGraphics
extension CGSize: Framed {
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
