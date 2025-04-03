//
//  BidirectionalCollection+MatrixIndexPathLookup.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/13/18.
//

#if canImport(Foundation)
import Foundation

/// Returns an index path of a given element if it exists in a 2d array. Section = index of array within 2d array, Row = index of element in child array.
@available(OSX 10.11, *)
public extension BidirectionalCollection where Element: BidirectionalCollection, Element.Iterator.Element: Equatable {
    func indexPathOf(_ element: Element.Iterator.Element) -> (row: Element.Index, section: Index)? {
        for sectionIndex in indices {
            let sectionArray = self[sectionIndex]
            for elementIndex in sectionArray.indices where sectionArray[elementIndex] == element {
                return (elementIndex, sectionIndex)
            }
        }
        return nil
    }
}
#endif
