//
//  String+Transformations.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/18/18.
//

extension String {
    
    /// Swiftest: Reverse string.
    public mutating func reverse() {
        let chars: [Character] = reversed()
        self = String(chars)
    }
}
