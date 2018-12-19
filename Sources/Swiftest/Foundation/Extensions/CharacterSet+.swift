//
//  CharacterSet+.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/17/18.
//

#if canImport(Foundation)
import Foundation

//Source: https://stackoverflow.com/questions/15741631/nsarray-from-nscharacterset/15742659#15742659
extension CharacterSet {
    
    public var random: Character{
        return characters.randomElement() ?? Character("")
    }
    
    public var characters: [Character] {
        // A Unicode scalar is any Unicode code point in the range U+0000 to U+D7FF inclusive or U+E000 to U+10FFFF inclusive.
        return codePoints().compactMap { UnicodeScalar($0) }.map { Character($0) }
    }
    
    private func codePoints() -> [Int] {
        var result: [Int] = []
        var plane = 0
        // following documentation at https://developer.apple.com/documentation/foundation/nscharacterset/1417719-bitmaprepresentation
        for (i, w) in bitmapRepresentation.enumerated() {
            let k = i % 8193
            if k == 8192 {
                // plane index byte
                plane = Int(w) << 13
                continue
            }
            let base = (plane + k) << 3
            for j in 0 ..< 8 where w & 1 << j != 0 {
                result.append(base + j)
            }
        }
        return result
    }
}

// MARK: - Methods
public extension Character {
    
    /// Swiftest: Random character.
    ///
    ///    Character.random() -> k
    ///
    /// - Returns: A random character.
    public static func randomAlphanumeric() -> Character {
        return .random(in: .alphanumerics)
    }
    
    public static func random(in set: CharacterSet) -> Character {
        return set.random
    }
}

#endif
