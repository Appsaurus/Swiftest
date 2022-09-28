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
}
#endif
