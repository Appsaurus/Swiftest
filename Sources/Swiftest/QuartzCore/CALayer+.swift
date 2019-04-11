//
//  CALayerExtensions.swift
//  Swiftest
//
//  Created by Brian Strobach on 6/15/16.
//  Copyright © 2018 Appsaurus
//

#if canImport(QuartzCore)
    import QuartzCore

    public extension CALayer {
        
        func pauseAnimations() {
            CALayer.pauseAnimations(self)
        }
        
        func resumeAnimations() {
            CALayer.resumeAnimations(self)
        }
        class func pauseAnimations(_ layer: CALayer) {
            let pausedTime: CFTimeInterval = layer.convertTime(CACurrentMediaTime(), from: nil)
            layer.speed = 0.0
            layer.timeOffset = pausedTime
        }
        
        class func resumeAnimations(_ layer: CALayer) {
            
            let pausedTime: CFTimeInterval = layer.timeOffset
            layer.speed = 1.0
            layer.timeOffset = 0.0
            layer.beginTime = 0.0
            let timeSincePause: CFTimeInterval = layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
            layer.beginTime = timeSincePause
        }
    }
#endif
