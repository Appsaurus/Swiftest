//
//  FloatConvertible.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/14/18.
//

public protocol FloatConvertible {
    var float: Float { get }    
}

public protocol FloatInitializable {
    init(_ float: Float)
}

extension Float: FloatConvertible, FloatInitializable {
    public var float: Float {
        return self
    }
}
extension Double: FloatConvertible, FloatInitializable {
    public var float: Float {
        return Float(self)
    }
}
extension Int: FloatConvertible, FloatInitializable {
    public var float: Float {
        return Float(self)
    }
}

#if canImport(CoreGraphics)
import CoreGraphics
extension CGFloat: FloatConvertible, FloatInitializable {
    public var float: Float {
        return Float(self)
    }
}
#endif

public protocol OptionalFloatConvertible {
    var float: Float? { get }
}

public protocol OptionalFloatInitializable {
    init?(_ float: Float)
}
extension String: OptionalFloatConvertible, FloatInitializable {
    
    public var float: Float? {
        return Float(self)
    }
}
