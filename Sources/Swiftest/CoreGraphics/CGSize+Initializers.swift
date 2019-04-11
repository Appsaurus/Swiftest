//
//  CGRect+Initializers.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/18/18.
//

#if canImport(CoreGraphics)
import CoreGraphics

public extension CGSize {
    init(side sideLength: CGFloat) {
        self.init(width: sideLength, height: sideLength)
    }
}
#endif
