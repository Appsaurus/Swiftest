//
//  CGRect+Arithmetic.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/18/18.
//


#if canImport(CoreGraphics)
import CoreGraphics

public extension CGSize{
    
    
    public var w: CGFloat {
        get {
            return self.width
        } set(value) {
            self.width = value
        }
    }
    
    
    public var h: CGFloat {
        get {
            return self.height
        } set(value) {
            self.height = value
        }
    }
    
    public var center: CGPoint{
        return CGPoint(x: width / 2.0, y: height / 2.0)
    }
    
    public var maxSideLength: CGFloat{
        return max(w, h)
    }
    
    public var minSideLength: CGFloat{
        return min(w, h)
    }
    
    public var area: CGFloat{
        return width * height
    }
    
    public init(side sideLength: CGFloat){
        self.init(width: sideLength, height: sideLength)
    }
    
    public var aspectRatio: CGFloat{
        return w/h
    }
    
    public var aspectRatioHeightToWidth: CGFloat{
        return h/w
    }
    
    public var diagonal: CGFloat{
        return sqrt(pow(width, 2) + pow(height, 2))
    }
}
#endif
