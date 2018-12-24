//
//  CGRectExtensions.swift
//  Pods
//
//  Created by Brian Strobach on 4/16/16.
//  Copyright © 2018 Appsaurus
//


#if canImport(CoreGraphics)
import CoreGraphics
    public extension CGRect{
        public var topLeft:CGPoint{
            return CGPoint(x:minX, y: minY)
        }
        
        public var topRight:CGPoint{
            return CGPoint(x:maxX, y: minY)
        }
        
        public var topCenter:CGPoint{
            return CGPoint(x:midX, y: minY)
        }
        
        public var bottomRight:CGPoint{
            return CGPoint(x:maxX, y: maxY)
        }
        
        public var bottomLeft:CGPoint{
            return CGPoint(x:minX, y: maxY)
        }
        
        
        // swiftlint:disable identifier_name
        /// X value of CGRect's origin
        public var x: CGFloat {
            get {
                return self.origin.x
            } set(value) {
                self.origin.x = value
            }
        }
        
        
        /// Y value of CGRect's origin
        public var y: CGFloat {
            get {
                return self.origin.y
            } set(value) {
                self.origin.y = value
            }
        }
        
        /// Width of CGRect's size
        public var w: CGFloat {
            get {
                return self.size.w
            } set(value) {
                self.size.w = value
            }
        }
        
        /// Height of CGRect's size
        public var h: CGFloat {
            get {
                return self.size.h
            } set(value) {
                self.size.h = value
            }
        }
        
    }
    
    public extension CGRect{
        
        public var diagonal: CGFloat{
            return CGPoint.distanceBetween(p1: topLeft, p2: bottomRight)
        }
        public var maxSideLength: CGFloat{
            return max(w, h)
        }
        
        public var minSideLength: CGFloat{
            return min(w, h)
        }
        public var center: CGPoint{
            return CGPoint(x: x + w/2, y: y + h/2)
        }
        public var aspectRatio: CGFloat{
            return w/h
        }
        
        public var aspectRatioHeightToWidth: CGFloat{
            return h/w
        }
        
        static public func rectWithCenter(_ center: CGPoint, width: CGFloat, height: CGFloat) -> CGRect{
            let originX:CGFloat = center.x - width/2.0
            let originY:CGFloat = center.y - height/2.0
            return CGRect(x: originX, y: originY, width: width, height: height)
        }
        
        public init(origin: CGPoint = .zero, sideLength: CGFloat){
            self.init(origin: origin, size: CGSize(side: sideLength))
        }
        
        public init(origin: CGPoint = .zero, width: Double, height: Double){
            self.init(origin: origin, size: CGSize(width: width, height: height))
        }
    
    }
    
#endif
