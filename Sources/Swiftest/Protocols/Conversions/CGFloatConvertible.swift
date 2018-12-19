//
//  CGCGFloatConvertible.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/14/18.
//

#if canImport(CoreGraphics)


public protocol CGFloatConvertible {
    var cgFloat: CGFloat { get }
}

public protocol CGFloatInitializable{
    init(_ cgFloat: CGFloat)
}


extension Float: CGFloatConvertible, CGFloatInitializable {
    public var cgFloat: CGFloat {
        return CGFloat(self)
    }
}
extension Double: CGFloatConvertible, CGFloatInitializable {
    public var cgFloat: CGFloat {
        return CGFloat(self)
    }
}
extension Int: CGFloatConvertible, CGFloatInitializable {
    public var cgFloat: CGFloat {
        return CGFloat(self)
    }
}

#if canImport(CoreGraphics)
import CoreGraphics
extension CGFloat: CGFloatConvertible, CGFloatInitializable {
    public var cgFloat: CGFloat {
        return CGFloat(self)
    }
}
#endif



public protocol OptionalCGFloatConvertible {
    var cgFloat: CGFloat? { get }
}

public protocol OptionalCGFloatInitializable{
    init?(_ cgFloat: CGFloat)
}
extension String: OptionalCGFloatConvertible, CGFloatInitializable{
    public init(_ cgFloat: CGFloat) {
        self.init(cgFloat.float)
    }
    
    
    public var cgFloat: CGFloat? {
        return float?.cgFloat
    }
}

#endif
