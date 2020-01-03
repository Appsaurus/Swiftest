//
//  Int+LocalizedDecimals.swift
//  Swiftest
//
//  Created by Brian Strobach on 1/2/20.
//

import Foundation

public extension Int {
    var localizedStringFormatted: String {
        return NumberFormatter.localizedString(from: self as NSNumber, number: .decimal)
    }
}
