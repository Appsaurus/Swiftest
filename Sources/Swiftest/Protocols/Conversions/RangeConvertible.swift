//
//  RangeConvertible.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/18/18.
//

#if canImport(Foundation)
import Foundation

//public protocol RangeConvertible{
//    func toRange<Index>(indexType: Index.Type) -> Range<Index>
//}

public extension NSRange {
    public func toRange(_ string: String) -> Range<String.Index> {
        return Range(self, in: string)!
    }
}
extension Range where Bound == String.Index {
    public func toNSRange(_ string: String) -> NSRange {
        return NSRange(self, in: string)
    } 
}

public protocol NSRangeConvertible {
    var nsRange: NSRange { get }
}

#endif

#if canImport(CoreFoundation)
import CoreFoundation

extension CFRange: NSRangeConvertible {
    public var nsRange: NSRange {
        return NSRange(location: self.location, length: self.length)
    }
}

public protocol CFRangeConvertible {
    var cfRange: CFRange { get }
}

extension NSRange: CFRangeConvertible {
    public var cfRange: CFRange {
        return CFRange(location: self.location, length: self.length)
    }
}
#endif
