//
//  CGRect+Initializers.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/27/18.
//

#if canImport(CoreGraphics)
import CoreGraphics

public extension CGRect {

    static func rectWithCenter(_ center: CGPoint, width: CGFloatConvertible, height: CGFloatConvertible) -> CGRect {
        let originX: CGFloat = center.x - width.cgFloat / 2.0
        let originY: CGFloat = center.y - height.cgFloat / 2.0
        return CGRect(x: originX, y: originY, width: width.cgFloat, height: height.cgFloat)
    }

    init(origin: CGPoint = .zero, sideLength: CGFloatConvertible) {
        self.init(origin: origin, size: CGSize(side: sideLength.cgFloat))
    }

    init(origin: CGPoint = .zero, width: CGFloatConvertible, height: CGFloatConvertible) {
        self.init(origin: origin, size: CGSize(width: width.cgFloat, height: height.cgFloat))
    }
}

#endif
