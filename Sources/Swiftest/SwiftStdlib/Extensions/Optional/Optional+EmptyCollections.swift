//
//  Optional+EmptyCollections.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/18/18.
//

// MARK: - Methods (Collection)
public extension Optional where Wrapped: Collection {
    
    /// Swiftest: Check if optional is nil or empty collection.
    var isNilOrEmpty: Bool {
        guard let collection = self else { return true }
        return collection.isEmpty
    }
    
    var hasNonEmptyValue: Bool {
        return !isNilOrEmpty
    }
    
    var removeEmpty: Wrapped? {
        guard let collection = self else { return nil }
        return collection.isEmpty ? nil : self
    }
}
