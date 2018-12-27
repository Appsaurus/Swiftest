//
//  CGSize+Sized.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/27/18.
//

#if canImport(CoreGraphics)
import CoreGraphics
extension CGSize: Sized {
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
