//
//  Dictionary+EnumKeyLookup.swift
//  
//
//  Created by Brian Strobach on 11/19/21.
//

public extension Dictionary {
    subscript<Enum>(_ enumCase: Enum) -> Value?
        where Enum: RawRepresentable, Enum.RawValue == Key {
            return self[enumCase.rawValue]
    }
}
