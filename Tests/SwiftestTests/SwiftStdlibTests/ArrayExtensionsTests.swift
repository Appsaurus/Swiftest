//
//  ArrayExtensionsTests.swift
//  Swiftest
//
//  Created by Brian Strobach on 8/26/16.
//  Copyright © 2018 Appsaurus
//
import XCTest
@testable import Swiftest

private struct Person: Equatable {
    var name: String
    var age: Int?

    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age
    }
}

private class Object: Equatable {
    var itemId: Int = 1
    static func == (lhs: Object, rhs: Object) -> Bool {
        return lhs.itemId == rhs.itemId
    }
}

final class ArrayExtensionsTests: XCTestCase {

    func testPrepend() {
        var arr = [2, 3, 4, 5]
        arr.prepend(1)
        XCTAssertEqual(arr, [1, 2, 3, 4, 5])
    }

    func testSafeSwap() {
        var array: [Int] = [1, 2, 3, 4, 5]
        array.safeSwap(from: 3, to: 0)
        XCTAssertEqual(array[3], 1)
        XCTAssertEqual(array[0], 4)

        var newArray = array
        newArray.safeSwap(from: 1, to: 1)
        XCTAssertEqual(newArray, array)

        newArray = array
        newArray.safeSwap(from: 1, to: 12)
        XCTAssertEqual(newArray, array)

        let emptyArray: [Int] = []
        var swappedEmptyArray = emptyArray
        swappedEmptyArray.safeSwap(from: 1, to: 3)
        XCTAssertEqual(swappedEmptyArray, emptyArray)
    }

    func testKeepWhile() {
        var input = [2, 4, 6, 7, 8, 9, 10]
        input.keep(while: {$0 % 2 == 0 })
        XCTAssertEqual(input, [2, 4, 6])

        input = [7, 7, 8, 10]
        input.keep(while: {$0 % 2 == 0 })
        XCTAssertEqual(input, [Int]())
    }

    func testTakeWhile() {
        var input = [2, 4, 6, 7, 8, 9, 10]
        var output = input.take(while: {$0 % 2 == 0 })
        XCTAssertEqual(output, [2, 4, 6])

        input = [7, 7, 8, 10]
        output = input.take(while: {$0 % 2 == 0 })
        XCTAssertEqual(output, [Int]())

        XCTAssertEqual([].take(while: {$0 % 2 == 0 }), [])
    }

    func testSkipWhile() {
        var input = [2, 4, 6, 7, 8, 9, 10]
        var output = input.skip(while: {$0 % 2 == 0 })
        XCTAssertEqual(output, [7, 8, 9, 10])

        input = [7, 7, 8, 10]
        output = input.skip(while: {$0 % 2 == 0 })
        XCTAssertEqual(output, [7, 7, 8, 10])

        XCTAssertEqual([].skip(while: { $0 % 2 == 0}), [])
    }

    func testDivided() {
        let input = [0, 1, 2, 3, 4, 5]
        let (even, odd) = input.divided { $0 % 2 == 0 }
        XCTAssertEqual(even, [0, 2, 4])
        XCTAssertEqual(odd, [1, 3, 5])

        // Parameter names + indexes
        let tuple = input.divided { $0 % 2 == 0 }
        XCTAssertEqual(tuple.matching, [0, 2, 4])
        XCTAssertEqual(tuple.0, [0, 2, 4])
        XCTAssertEqual(tuple.nonMatching, [1, 3, 5])
        XCTAssertEqual(tuple.1, [1, 3, 5])
    }

    func testKeyPathSorted() {
        
        let alex1 = Person(name: "Alex", age: 1)
        let brian2 = Person(name: "Brian", age: 2)
        let carl3 = Person(name: "Carl", age: 3)
        let bernie4 = Person(name: "Bernie", age: 4)
        let carol5 = Person(name: "Carol", age: 5)
        
        let adamUnknown = Person(name: "Adam", age: nil)
        
        let array = [alex1, brian2, carl3, carol5, bernie4, adamUnknown].shuffled()
        
        let nameAscending = [adamUnknown, alex1, bernie4, brian2, carl3, carol5]
        let nameDescending: [Person] = nameAscending.reversed()
        
        XCTAssertEqual(array.sorted(by: \.name), nameAscending)
        XCTAssertEqual(array.sorted(by: \.name, .descending), nameDescending)
        
        let ageAscendingNilsLast: [Person] = [alex1, brian2, carl3, bernie4, carol5, adamUnknown]
        let ageAscendingNilsFirst: [Person] = [adamUnknown, alex1, brian2, carl3, bernie4, carol5]
        
        let ageDescendingNilsLast: [Person] = [carol5, bernie4, carl3, brian2, alex1, adamUnknown]
        let ageDescendingNilsFirst: [Person] = [adamUnknown, carol5, bernie4, carl3, brian2, alex1]
        
        // Testing Optional keyPath
        XCTAssertEqual(array.sorted(by: \Person.age, OptionalSortOrder.ascendingNilsLast), ageAscendingNilsLast)
        XCTAssertEqual(array.sorted(by: \Person.age, OptionalSortOrder.ascendingNilsFirst), ageAscendingNilsFirst)
        XCTAssertEqual(array.sorted(by: \Person.age, OptionalSortOrder.descendingNilsLast), ageDescendingNilsLast)
        XCTAssertEqual(array.sorted(by: \Person.age, OptionalSortOrder.descendingNilsFirst), ageDescendingNilsFirst)

        // Testing Mutating
        var mutableArray = array //Copy

        mutableArray.sort(by: \.name, .ascending)
        XCTAssertEqual(mutableArray, nameAscending)
        mutableArray.sort(by: \.name, .descending)
        XCTAssertEqual(mutableArray, nameDescending)

        // Testing Mutating Optional keyPath
        mutableArray.sort(by: \.age, .ascendingNilsLast)
        XCTAssertEqual(mutableArray, ageAscendingNilsLast)
        mutableArray.sort(by: \.age, .ascendingNilsFirst)
        XCTAssertEqual(mutableArray, ageAscendingNilsFirst)
        mutableArray.sort(by: \.age, .descendingNilsLast)
        XCTAssertEqual(mutableArray, ageDescendingNilsLast)
        mutableArray.sort(by: \.age, .descendingNilsFirst)
        XCTAssertEqual(mutableArray, ageDescendingNilsFirst)

    }
    
    func testRemoveObject() {
        let object1 = Object()
        let object2 = Object()
        let object1Ref = object1
        var arr: [Object] = [object1, object2, object1Ref]
        arr.remove(object: object1)
        XCTAssertFalse(arr.contains(where: {$0 === object1}))
        XCTAssertFalse(arr.contains(where: {$0 === object1Ref}))
        XCTAssertEqual(arr, [object2])
        arr = []
        arr.remove(objects: object1)
        XCTAssertEqual(arr, [])
    }
    
    func testRemoveObjects() {
        let object1 = Object()
        let object2 = Object()
        let object3 = Object()
        let object1Ref = object1
        var arr: [Object] = [object1, object2, object3, object1Ref]
        arr.remove(objects: object1, object2)
        XCTAssertFalse(arr.contains(where: {$0 === object1}))
        XCTAssertFalse(arr.contains(where: {$0 === object1Ref}))
        XCTAssertEqual(arr, [object3])
        arr = []
        arr.remove(objects: object1)
        XCTAssertEqual(arr, [])
    }
    
    func testRemoveValue() {
        var arr = [0, 1, 2, 0, 3, 4, 5, 0, 0]
        arr.remove(values: 0)
        XCTAssertEqual(arr, [1, 2, 3, 4, 5])
        arr = []
        arr.remove(values: 0)
        XCTAssertEqual(arr, [])
    }

    func testRemoveValues() {
        var arr = [0, 1, 2, 2, 0, 3, 4, 5, 0, 0]
        arr.remove(values: [0, 2])
        XCTAssertEqual(arr, [1, 3, 4, 5])
        arr.remove(values: [])
        XCTAssertEqual(arr, [1, 3, 4, 5])
        arr = []
        arr.remove(values: [])
        XCTAssertEqual(arr, [])
    }

    var duplicatedIntArray = [1, 1, 2, 2, 3, 3, 3, 4, 5]
    var dedupedIntArray = [1, 2, 3, 4, 5]
    var duplicatedStringArray = ["h", "e", "l", "l", "o"]
    var dedupedStringArray = ["h", "e", "l", "o"]
    
    func testRemoveDuplicates() {
        var intArray = duplicatedIntArray
        intArray.removeDuplicates()
        XCTAssertEqual(intArray, dedupedIntArray)
        
        var stringArray = duplicatedStringArray
        stringArray.removeDuplicates()
        XCTAssertEqual(stringArray, dedupedStringArray)
    }

    func testWithoutDuplicates() {
        let intArray = duplicatedIntArray
        XCTAssertEqual(intArray.withoutDuplicates, dedupedIntArray)
        
        let stringArray = duplicatedStringArray
        XCTAssertEqual(stringArray.withoutDuplicates, dedupedStringArray)
    }
    
    func testremoveDuplicateReferences() {
        let object1 = Object()
        let object2 = Object()
        let object3 = Object()
        object3.itemId = 3
        let object1Ref = object1
        var arr: [Object] = [object1, object1, object1Ref, object2, object3]
        arr.removeDuplicateReferences()
        XCTAssert(arr.count == 3)
        arr.removeDuplicates()
        XCTAssert(arr.count == 2)
    }
    
    func testwithoutDuplicateReferences() {
        let object1 = Object()
        let object2 = Object()
        let object3 = Object()
        object3.itemId = 3
        let object1Ref = object1
        let arr: [Object] = [object1, object1, object1Ref, object2, object3]
        XCTAssert(arr.withoutDuplicateReferences.count == 3)
        XCTAssert(arr.withoutDuplicates.count == 2)
    }
}
