//
//  Collection+Lookup.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/17/18.
//

extension Collection{    
    
    public subscript(indices: Index...) -> [Element]{
        return elementsAtIndices(indices)
    }
    
    public subscript(indices: [Index]) -> [Element]{
        return elementsAtIndices(indices)
    }
    
    public func elementsAtIndices(_ indices: [Index]) -> [Element]{
        return indices.map { (index) -> Element in
            self[index]
        }
    }
    
    /// Swiftest: Returns the element at the specified position. If offset
    /// is negative, the `n`th element from the end will be returned where `n`
    /// is the result of `abs(distance)`.
    ///
    ///        let arr = [1, 2, 3, 4, 5]
    ///        arr[offset: 1] -> 2
    ///        arr[offset: -2] -> 4
    ///
    /// - Parameter distance: The distance to offset.
    public subscript(offset distance: Int) -> Element {
        return self[indexOffset(by: distance)]
    }
    
    public subscript (normalizedIndex normalizedIndex: FloatLiteralType) -> Element {
        let normalizedIndex = normalizedIndex.clamped(0.0, 1.0)
        let offset = Int((Double(count - 1) * normalizedIndex))
        return self[offset: offset]
    }
}
