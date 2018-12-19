//
//  BiDirectionalCollection+Matrix.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/13/18.
//

//import Foundation

public typealias Matrix<Element> = [[Element]]
public typealias Array2D<Element> = [[Element]]

public enum MatrixMajorOrder{
    case row
    case column
}
/// Returns an index path of a given element if it exists in a 2d array. Section = index of array within 2d array, Row = index of element in child array.

public extension Collection where Element: Collection, Element.Iterator.Element : Equatable{    
    
    public func indexOf(_ element: Element.Iterator.Element) -> (row: Index, column: Element.Index)?{
        for sectionIndex in indices{
            let elementToCheck = self[sectionIndex]
            for elementIndex in elementToCheck.indices{
                if elementToCheck[elementIndex] == element{
                    return (sectionIndex, elementIndex)
                }
            }
        }
        return nil
    }
    
    public func forEach(in order: MatrixMajorOrder = .row, _ body: (_ row: Index, _ column: Element.Index, _ element: Element.Iterator.Element) -> Void){
        
        switch order{
            
        case .row:
            for rowIndex in indices{
                let columnCollection = self[rowIndex]
                for columnIndex in columnCollection.indices{
                    body(rowIndex, columnIndex, columnCollection[columnIndex])
                }
            }
        case .column:
            for (offset, index) in indices.enumerated(){
                let element = self[index]
                guard let innerIndex = element.index(element.startIndex, offsetBy: offset, limitedBy: element.lastIndex),
                    let innerElement = element[safe: innerIndex] else { continue }
                body(index, innerIndex, innerElement)
            }
        }
    }
}
