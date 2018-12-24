//
//  Collection+Indices.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/16/18.
//

extension Collection {
    //Returns index to left in case of even count.
    public var midIndex: Index {
        guard self.count > 2 else { return startIndex }
        return indexOffset(by: (count - 1)/2)
    }
    
    public var midIndexRightTiebreaker: Index {
        guard self.count > 1 else { return startIndex }
        return indexOffset(by: (count)/2)
        
    }
    
    public var lastIndex: Index {
        guard count > 0 else { return startIndex}
        return indexOffset(by: -1)
    }
    
    public func indexOffset(by distance: Int) -> Index {
        let originIndex = distance >= 0 ? startIndex : endIndex
        return index(originIndex, offsetBy: distance)
    }
    
    public var fullIndexRange: Range<Index> {
        return startIndex..<endIndex
    }
}
