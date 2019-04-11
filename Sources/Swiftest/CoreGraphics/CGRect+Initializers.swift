//
//  CGRect+Initializers.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/27/18.
//

#if canImport(CoreGraphics)
import CoreGraphics

public extension CGRect {

    static func rectWithCenter(_ center: CGPoint, width: CGFloat, height: CGFloat) -> CGRect {
        let originX: CGFloat = center.x - width/2.0
        let originY: CGFloat = center.y - height/2.0
        return CGRect(x: originX, y: originY, width: width, height: height)
    }

    init(origin: CGPoint = .zero, sideLength: CGFloat) {
        self.init(origin: origin, size: CGSize(side: sideLength))
    }

    init(origin: CGPoint = .zero, width: Double, height: Double) {
        self.init(origin: origin, size: CGSize(width: width, height: height))
    }
}

#endif
