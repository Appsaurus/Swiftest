//
//  String+Captialization.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/18/18.
//

import Foundation

public extension String {
    
    enum CaseFormat {
        case hyphenated
        case snake_case
        case camelCase
    }
    
    @discardableResult
    mutating func format(as format: CaseFormat) -> String {
        self = formatted(as: format)
        return self
    }
    func formatted(as format: CaseFormat) -> String {
        switch format {
        case .hyphenated:
            return separated(by: "-")
        case .snake_case:
            return separated(by: "_")
        case .camelCase:
            return camelCase()
        }
    }
}

extension String {
    
    internal func separated(by separatorCharacter: Character) -> String {
        let trimmed = self.trimmed
        guard !trimmed.contains(" ") else {
            return trimmed.replacingOccurrences(of: " ", with: "\(separatorCharacter)").lowercased()
        }
        let characters = Array(trimmed)
        
        guard var expanded = characters
            .first
            .flatMap({ String($0) })
            else {
                return self
        }
        
        for (index, char) in characters.suffix(from: 1).enumerated() {
            if char.isUppercased && characters[safe: index]?.isUppercase == false {
                expanded.append(separatorCharacter)
            }

            expanded.append(char)
        }
        
        return expanded.lowercased()
    }
    
    /// Swiftest: Converts string format to CamelCase.
    ///
    ///        var str = "sOme vaRiabLe Name"
    ///        str.camelize()
    ///        print(str) // prints "someVariableName"
    ///
    internal func camelCase() -> String {
        guard count > 0 else {
            return self
        }
        
        let source = lowercased()
        let first = source[..<source.index(after: source.startIndex)]
        if source.contains(" ") {
            let connected = source.capitalized.replacingOccurrences(of: " ", with: "")
            let camel = connected.replacingOccurrences(of: "\n", with: "")
            let rest = String(camel.dropFirst())
            return first + rest
        }
        let rest = String(source.dropFirst())
        
        return first + rest
    }
}
extension String {
    
    @discardableResult
    public mutating func uppercase() -> String {
        self = uppercased()
        return self
    }
    
    @discardableResult
    public mutating func lowercase() -> String {
        self = lowercased()
        return self
    }
    
    /// Swiftest: First character of string uppercased(if applicable) while keeping the original string.
    ///
    ///        "hello world".uppercaseFirstCharacter() -> "Hello world"
    ///        "".uppercaseFirstCharacter() -> ""
    ///
    @discardableResult
    public mutating func uppercaseFirstCharacter() -> String {
        self = firstCharacterUppercased
        return self
    }
    
    /// Swiftest: First character of string uppercased(if applicable) while keeping the original string.
    ///
    ///        "hello world".firstCharacterUppercased -> "Hello world"
    ///        "".uppercasedFirstCharacter -> ""
    ///
    public var firstCharacterUppercased: String {
        guard let first = first else { return  self }
        return String(first).uppercased() + dropFirst()
    }
    
    /// Lowercases first character of String
    public mutating func lowercaseFirstLetter() {
        self = self.firstLetterLowerCased
    }
    
    /// Returns copy of string with the first character of String lowercased
    public var firstLetterLowerCased: String {
        var result: String = self
        result.replaceSubrange(startIndex...startIndex, with: String(self[startIndex]).lowercased())
        return result
    }

    public mutating func capitalizeInitials() {
        self = self.capitalizedInitials
    }
    
    public var capitalizedInitials: String {
        let capitalizedWords: [String] = words().map {$0.capitalized}
        return capitalizedWords.joined(separator: " ")
    }
}

public extension String {

    var camelCaseToWords: String {

        return unicodeScalars.reduce("") {

            if CharacterSet.uppercaseLetters.contains($1) {

                return ($0 + " " + String($1))
            }
            else {

                return $0 + String($1)
            }
        }
    }
}
