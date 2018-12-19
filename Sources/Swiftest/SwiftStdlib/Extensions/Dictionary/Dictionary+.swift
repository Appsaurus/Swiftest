//
//  DictionaryExtensions.swift
//  Pods
//
//  Created by Brian Strobach on 4/10/17.
//
//

import Foundation

extension Dictionary {
    
    /// Access a dictionaries values given a key prioritization.
    ///
    /// - Parameter prioritizedKeys: Keys ordered by priority
    /// - Returns: The value for the first key that is non nil, or nil if none of the keys have values.
    public func firstValue(for prioritizedKeys: Key...) -> Value?{
        for key in prioritizedKeys {
            if let value = self[key]{ return value }
        }
        return nil
    }
}

extension Dictionary {
    /// Swiftest: Check if key exists in dictionary.
    ///
    ///        let dict: [String : Any] = ["testKey": "testValue", "testArrayKey": [1, 2, 3, 4, 5]]
    ///        dict.has(key: "testKey") -> true
    ///        dict.has(key: "anotherKey") -> false
    ///
    /// - Parameter key: key to search for
    /// - Returns: true if key exists in dictionary.
    public func has(key: Key) -> Bool {
        return index(forKey: key) != nil
    }
    
    /// Swiftest: Returns a dictionary containing the results of mapping the given closure over the sequence’s elements.
    /// - Parameter transform: A mapping closure. `transform` accepts an element of this sequence as its parameter and returns a transformed value of the same or of a different type.
    /// - Returns: A dictionary containing the transformed elements of this sequence.
    public func mapKeysAndValues<K, V>(_ transform: ((key: Key, value: Value)) throws -> (K, V)) rethrows -> [K: V] {
        return [K: V](uniqueKeysWithValues: try map(transform))
    }
    
    /// Swiftest: Returns a dictionary containing the non-`nil` results of calling the given transformation with each element of this sequence.
    /// - Parameter transform: A closure that accepts an element of this sequence as its argument and returns an optional value.
    /// - Returns: A dictionary of the non-`nil` results of calling `transform` with each element of the sequence.
    /// - Complexity: *O(m + n)*, where _m_ is the length of this sequence and _n_ is the length of the result.
    public func compactMapKeysAndValues<K, V>(_ transform: ((key: Key, value: Value)) throws -> (K, V)?) rethrows -> [K: V] {
        return [K: V](uniqueKeysWithValues: try compactMap(transform))
    }
    
    /// Swiftest: Remove all keys contained in the keys parameter from the dictionary.
    ///
    ///        var dict : [String : String] = ["key1" : "value1", "key2" : "value2", "key3" : "value3"]
    ///        dict.removeAll(keys: ["key1", "key2"])
    ///        dict.keys.contains("key3") -> true
    ///        dict.keys.contains("key1") -> false
    ///        dict.keys.contains("key2") -> false
    ///
    /// - Parameter keys: keys to be removed
    public mutating func removeAll<S: Sequence>(keys: S) where S.Element == Key {
        keys.forEach { removeValue(forKey: $0) }
    }
    
}

// MARK: - Methods (Value: Equatable)
public extension Dictionary where Value: Equatable {
    
    /// Swiftest: Returns an array of all keys that have the given value in dictionary.
    ///
    ///        let dict = ["key1": "value1", "key2": "value1", "key3": "value2"]
    ///        dict.keys(forValue: "value1") -> ["key1", "key2"]
    ///        dict.keys(forValue: "value2") -> ["key3"]
    ///        dict.keys(forValue: "value3") -> []
    ///
    /// - Parameter value: Value for which keys are to be fetched.
    /// - Returns: An array containing keys that have the given value.
    public func keys(forValue value: Value) -> [Key] {
        return keys.filter { self[$0] == value }
    }
    
}

// MARK: - Methods (ExpressibleByStringLiteral)
public extension Dictionary where Key: StringProtocol {
    
    /// Swiftest: Lowercase all keys in dictionary.
    ///
    ///        var dict = ["tEstKeY": "value"]
    ///        dict.lowercaseAllKeys()
    ///        print(dict) // prints "["testkey": "value"]"
    ///
    public mutating func lowercaseAllKeys() {
        // http://stackoverflow.com/questions/33180028/extend-dictionary-where-key-is-of-type-string
        for key in keys {
            if let lowercaseKey = String(describing: key).lowercased() as? Key {
                self[lowercaseKey] = removeValue(forKey: key)
            }
        }
    }
}

// MARK: - Subscripts
public extension Dictionary {
    
    /// Swiftest: Deep fetch or set a value from nested dictionaries.
    ///
    ///        var dict =  ["key": ["key1": ["key2": "value"]]]
    ///        dict[path: ["key", "key1", "key2"]] = "newValue"
    ///        dict[path: ["key", "key1", "key2"]] -> "newValue"
    ///
    /// - Note: Value fetching is iterative, while setting is recursive.
    ///
    /// - Complexity: O(N), _N_ being the length of the path passed in.
    ///
    /// - Parameter path: An array of keys to the desired value.
    ///
    /// - Returns: The value for the key-path passed in. `nil` if no value is found.
    public subscript(path path: [Key]) -> Any? {
        get {
            guard !path.isEmpty else { return nil }
            var result: Any? = self
            for key in path {
                if let element = (result as? [Key: Any])?[key] {
                    result = element
                } else {
                    return nil
                }
            }
            return result
        }
        set {
            if let first = path.first {
                if path.count == 1, let new = newValue as? Value {
                    return self[first] = new
                }
                if var nested = self[first] as? [Key: Any] {
                    nested[path: Array(path.dropFirst())] = newValue
                    return self[first] = nested as? Value
                }
            }
        }
    }
}

//MARK: Typed lookups for Any Values
extension Dictionary where Key: Hashable, Value: Any{
    
	public func get<A: Any>(_ type: A.Type, at key: Key) -> A?{
		guard let value = self[key] as? A else { return nil }
		return value
	}
    
	public func get<A: Any>(_ type: A.Type, at key: Key, orThrow error: Error? = nil) throws -> A{
		guard let value = get(type, at: key) else{
			let foundValue = self[key]
			let foundValueDescription = String(describing: foundValue.self)
			let debugDescription = "Expected type \(type) at \(key) but found \(foundValueDescription) instead."
			let error = error ?? DecodingError.dataCorrupted(DecodingError.Context(codingPath: [],
																				   debugDescription: debugDescription))
			throw error
		}
		return value
	}
}


//MARK: Pretty printing
extension Dictionary where Key: StringProtocol, Value: Any{
	public func printPretty(){
		print("\(prettyPrinted)")
	}

	public var prettyPrinted: String{
		return "\(self as AnyObject)"
	}
}


