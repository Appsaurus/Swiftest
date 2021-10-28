//
//  String+CharacterSet.swift
//  Swiftest
//
//  Created by Brian Strobach on 10/28/21.
//

import Foundation

public extension String {
    mutating func remove(_ characters: [CharacterSet]) -> String {
        self = removing(characters)
        return self
    }

    mutating func remove(_ characters: CharacterSet...) -> String {
        return remove(characters)
    }

    func removing(_ characters: [CharacterSet]) -> String {
        let set: CharacterSet = characters.reduce(CharacterSet(), {$0.union($1)})
        let filtered = unicodeScalars.lazy.filter { !set.contains($0)}
        return String(String.UnicodeScalarView(filtered))
    }

    func removing(_ characters: CharacterSet...) -> String {
        return removing(characters)
    }

    mutating func removeCharacters(in string: String) -> String {
        self = removingCharacters(in: string)
        return self
    }

    func removingCharacters(in string: String) -> String {
        let characterSet = CharacterSet(charactersIn: string)
        return removing(characterSet)
    }

    func containsAny(substrings: [String], caseSensitive: Bool = false) -> Bool {
        return substrings.contains(where: {self.contains($0, caseSensitive: caseSensitive)})
    }

    func starts(withAny prefixes: [String], caseSensitive: Bool = false) -> Bool {
        return prefixes.contains(where: {self.starts(with: $0, caseSensitive: caseSensitive)})
    }
}
