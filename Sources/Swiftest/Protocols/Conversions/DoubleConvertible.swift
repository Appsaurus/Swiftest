//
//  DoubleConvertible.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/14/18.
//

public protocol DoubleConvertible {
    var double: Double { get }
}

public protocol DoubleInitializable {
    init(_ double: Double)
}

extension Double: DoubleConvertible, DoubleInitializable {
    public var double: Double {
        return self
    }
}
extension Float: DoubleConvertible, DoubleInitializable {
    public var double: Double {
        return Double(self)
    }
}
extension Int: DoubleConvertible, DoubleInitializable {
    public var double: Double {
        return Double(self)
    }
}

#if canImport(CoreGraphics)
import CoreGraphics
extension CGFloat: DoubleConvertible, DoubleInitializable {
    public var double: Double {
        return Double(self)
    }
}
#endif

public protocol OptionalDoubleConvertible {
    var double: Double? { get }
}

extension String: OptionalDoubleConvertible, DoubleInitializable {
    
    public var double: Double? {
        return Double(self)
    }
}
