//
//  String+FullRange.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/18/18.
//

#if canImport(Foundation)
import Foundation

extension String{
    public var fullIndexNSRange: NSRange{
        return self.fullIndexRange.toNSRange(self)
    }
}
#endif

#if canImport(CoreFoundation)
import CoreFoundation

extension String{
    public var fullIndexCFRange: CFRange{
        return fullIndexNSRange.cfRange
    }
}
#endif


    
    



