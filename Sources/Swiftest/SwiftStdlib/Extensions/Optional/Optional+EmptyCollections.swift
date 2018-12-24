//
//  Optional+EmptyCollections.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/18/18.
//

// MARK: - Methods (Collection)
public extension Optional where Wrapped: Collection {
    
    /// Swiftest: Check if optional is nil or empty collection.
    public var isNilOrEmpty: Bool {
        guard let collection = self else { return true }
        return collection.isEmpty
    }
    
    public var hasNonEmptyValue: Bool {
        return !isNilOrEmpty
    }
    
    public var removeEmpty: Optional<Wrapped> {
        guard let collection = self else { return nil }
        return collection.isEmpty ? nil : self
    }
}
