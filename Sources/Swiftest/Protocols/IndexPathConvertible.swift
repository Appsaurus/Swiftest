//
//  IndexPathConvertible.swift
//  Pods
//
//  Created by Brian Strobach on 2/20/18.
//

import Foundation

extension IndexPath: ExpressibleByIntegerLiteral{
    public typealias IntegerLiteralType = Int
    
    public init(integerLiteral value: Int) {
        self.init(item: value, section: 0)
    }
}
