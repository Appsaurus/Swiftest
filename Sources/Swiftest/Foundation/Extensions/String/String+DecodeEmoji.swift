//
//  String+DecodeEmoji.swift
//  
//
//  Created by Brian Strobach on 9/28/22.
//
import Foundation

public extension String {
    var decodeEmoji: String {
        guard let data : Data = self.data(using: .nonLossyASCII),
              let valueUnicode : String = String(data: data, encoding: .utf8),
              let dataa = valueUnicode.data(using: .utf8),
              let valueEmoj : String = String(data: dataa, encoding: .nonLossyASCII) else { return self }
          return valueEmoj
    }
}
