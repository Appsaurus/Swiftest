//
//  KeyPathFilter.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/27/18.
//
// Based on https://medium.com/@vhart/https-medium-com-vhart-building-a-filter-with-swift-4-keypaths-ad236a8ab4da


/// Uses closure type erasure to create type-safe KeyPath filters.

public typealias KeyPathFilters<Object> = [KeyPathFilter<Object>]
public struct KeyPathFilter<Object> {

    let keyPath: PartialKeyPath<Object>
    private let predicate: Predicate<Any>

    public init<Type>(keyPath: KeyPath<Object, Type>, matcher: @escaping Predicate<Type>) {
        self.keyPath = keyPath
        self.predicate = { value in
            guard let typedValue = value as? Type else { return false }
            return matcher(typedValue)
        }
    }

    public func includes(_ object: Object) -> Bool {
        let value = object[keyPath: keyPath]
        return predicate(value)
    }
}

extension Collection{
    public func filtered(by filters: KeyPathFilter<Element>...) -> [Element]{
        return filtered(by: filters)
    }

    public func filtered(by filters: KeyPathFilters<Element>) -> [Element]{
        return filter { object in
            for filter in filters {
                guard filter.includes(object) else { return false }
            }
            return true
        }
    }
}
