//
//  NSMutableAttributedStringExtensions.swift
//  Pods
//
//  Created by Brian Strobach on 5/24/16.
//  Copyright © 2018 Appsaurus
//

#if canImport(Foundation)
import Foundation

public extension NSMutableAttributedString {
    
    @discardableResult
    func addAttribute(_ key: NSAttributedString.Key, value: AnyObject) -> NSMutableAttributedString {
        addAttribute(key, value: value, range: fullRange)
        return self
    }
    
    @discardableResult
    func addAttributes(_ attrs: [NSAttributedString.Key: AnyObject]) -> NSMutableAttributedString {
        addAttributes(attrs, range: fullRange)
        return self
    }
    
    @discardableResult
    func appendString(_ string: String) -> NSMutableAttributedString {
        self.append(NSAttributedString(string: string))
        return self
    }
    
    @discardableResult
    func appendLineBreak(count: Int = 1) -> NSMutableAttributedString {        
        for _ in 0...count {
            self.append(NSAttributedString(string: "\n"))
        }
        return self
    }
}

public extension NSMutableAttributedString {
    
    convenience init(attributedStrings: [NSAttributedString], separatedByLineBreaks: Bool = false) {
        self.init(attributedString: attributedStrings.first!)
        attributedStrings.enumerated().forEach { (index, element) in
            if index != 0 {
                if separatedByLineBreaks && index != attributedStrings.count {
                    appendLineBreak()
                }
                append(element)
            }
        }
    }
}

public func + (lhs: NSMutableAttributedString, rhs: NSMutableAttributedString) -> NSMutableAttributedString {
    let mutableLhs: NSMutableAttributedString = NSMutableAttributedString(attributedString: lhs)
    mutableLhs.append(rhs)
    return mutableLhs
}

public func + (lhs: String, rhs: NSMutableAttributedString) -> NSMutableAttributedString {
    let lhsAttributed: NSMutableAttributedString = NSMutableAttributedString(string: lhs, attributes: rhs.attributes(at: 0, effectiveRange: nil))
    return lhsAttributed + rhs
}

public func + (lhs: NSMutableAttributedString, rhs: String) -> NSMutableAttributedString {
    let rhsAttributed: NSMutableAttributedString = NSMutableAttributedString(string: rhs, attributes: lhs.attributes(at: 0, effectiveRange: nil))
    return lhs + rhsAttributed
}

#endif
