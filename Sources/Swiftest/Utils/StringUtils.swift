//
//  StringUtils.swift
//  Pods
//
//  Created by Brian Strobach on 2/1/18.
//

import Foundation

public class StringUtils {
	public class English {
		public static func punctuatedList(from words: [String], conjunction: String = "and", includeOxfordComma: Bool = true ) -> String {
            switch words.count {
            case 0: return ""
            case 1: return words[0]
            case 2: return words[0] + " \(conjunction) " + words[1]
            default:
                guard let lastWord = words.last else { return "" }
                let separator = ", "

                let allButLast = words.dropLast()
                let list = allButLast.joined(separator: separator)
                guard includeOxfordComma else {
                    return [list, conjunction, lastWord].joined(separator: " ")
                }
                return "\(list), \(conjunction) \(lastWord)"
            }
		}

		public static func indefiniteArticle(for str: String) -> String {
			let a = "a"
			let an = "an"

			// typeical "a" matching patterns
			//   words starting with a hard constant: domino eats a boy, a taco, a zebra
			//   words starting with a hard o: domino eats a one, a once in a lifetime offer
			//        (but an oncologist)
			//   words starting with a hard vowel: domino eats a euro, a ukulele,
			//        a uranium screw (but an urban outfitter), a useful idea, a utility belt,
			//        a unicorn, (but an uninvited guest)
			//
			let aPatterns = "^(([bcdgjkpqtuvwyz]|onc?e|onetime)$|e[uw]|uk|ur[aeiou]|use|ut([^t])|uni(l[^l])|uni[^nmd])"

			// specific "an" patterns
			//   words starting with a soft h: domino eats an hour, an honest man.
			//   words starting with a soft vowel: domino eats an apple, an elephant, an orange
			//   or any single letters with a soft vowel sound: domino eats an a, an a, an r, an x
			//   or anything that leads with 8: domino eats an 8, an 800 lb gorilla
			//
			let anPatterns = "^(([aefhilmnorsx]$)|(hono|honest|hour|heir|[aeiou]|8))"

			// Capital words or abbreviations which should likely be preceeded by an "a":
			//    Domino eata a UUID, a URL, a JOB
			//
			let uppercaseAPatterns = "^([BCDJKPQTUVWYZ][A-Z]+)"

			// Capital words which should likely be preceeded by an "a":
			//    Domino eats an API, an LP, an HOV
			//
			let uppercaseAnPatterns = "^([AEFHILMNORSX][A-Z]+)"

			do {
				var regex = try NSRegularExpression(pattern: "\\w+", options: [.caseInsensitive])
				var matches = regex.matches(in: str, options: [], range: NSRange(location: 0, length: str.count))

				// weird case: no match (input was empty), this could happen if it's either
				// an empty string, or something non-word charactor like.
				//
				if matches.count == 0 {
					// if it's truly empty, then return empty.
					//
					if str.count == 0 {
						return ""
					}

					// otherwise, let's defualt to an "a", i.e. "a ©".
					//
					return a
				}

				// Get the first word in the string
				//
				guard let word = str.words().first else {
					return ""
				}

				// case sensitive matching...
				//
				regex = try NSRegularExpression(pattern: uppercaseAnPatterns, options: [])
				matches = regex.matches(in: word, options: [], range: NSRange(location: 0, length: word.count))
				if matches.count > 0 {
					return an
				}

				regex = try NSRegularExpression(pattern: uppercaseAPatterns, options: [])
				matches = regex.matches(in: word, options: [], range: NSRange(location: 0, length: word.count))
				if matches.count > 0 {
					return a
				}

				// insensitive...
				//
				regex = try NSRegularExpression(pattern: aPatterns, options: [.caseInsensitive])
				let aMatches = regex.matches(in: word, options: [], range: NSRange(location: 0, length: word.count))

				regex = try NSRegularExpression(pattern: anPatterns, options: [.caseInsensitive])
				let anMatches = regex.matches(in: word, options: [], range: NSRange(location: 0, length: word.count))

				// balancing the specificity of aMatches, as they could be stonger then the
				// general vowel matching of the an
				//
				if anMatches.count > 0 {
					if aMatches.count > 0 {
						return a
					}
					return an
				}

				// anything else gets an a.
				//
				return a
			} catch {
				return a
			}
		}
	}
}

public extension String {
    func indefiniteArticle() -> String {
		return StringUtils.English.indefiniteArticle(for: self)
	}

}

extension CharacterSet {
	static public let vowels = CharacterSet(charactersIn: "aeiouAEIOU")
	static public let consonants = CharacterSet(charactersIn: "bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ")
}
extension Character {

	public var characterSetValue: CharacterSet { return CharacterSet(charactersIn: String(self)) }
	public var isVowel: Bool { return CharacterSet.vowels.isSuperset(of: characterSetValue) }
	public var isConsonant: Bool { return CharacterSet.consonants.isSuperset(of: characterSetValue) }
}
extension String {
	public var beginsWithVowel: Bool {
		return first?.isVowel ?? false
	}
	public var beginsWithConsonant: Bool {
		return first?.isConsonant ?? false
	}
}
