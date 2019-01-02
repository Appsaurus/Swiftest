//
//  CGSize+Sized.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/27/18.
//

#if canImport(CoreGraphics)
import CoreGraphics
extension CGSize: Sized {
    public var w: CGFloat {
        get {
            return width
        } set(value) {
            self = CGSize(width: value, height: h)
        }
    }

    public var h: CGFloat {
        get {
            return height
        } set(value) {
            self = CGSize(width: w, height: value)
        }
    }
    
    public var size: CGSize {
        get {
            return self
        }
        set(value) {
            self = value
        }
    }
}
#endif
