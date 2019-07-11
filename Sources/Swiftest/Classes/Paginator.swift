//
//  Pagination.swift
//  Datastorus
//
//  Created by Brian Strobach on 3/29/16.
//  Copyright © 2018 Appsaurus
//

import Foundation

public typealias PaginationResultsClosure<M: Hashable> = ((items: [M], isLastPage: Bool)) -> Void
public typealias PaginationResult<M: Hashable> = (items: [M], isLastPage: Bool)

open class Paginator<ModelType> where ModelType: Hashable {
    
    open var searchQuery: String?

    open var hasLoadedFirstPage: Bool {
        assertionFailure(String(describing: self) + " is abstract. You must implement " + #function)
        return false
    }

    open var hasLoadedAllPages: Bool {
        assertionFailure(String(describing: self) + " is abstract. You must implement " + #function)
        return false
    }
    
    public init() {
        
    }
    
    open func fetchNextPage(success: @escaping PaginationResultsClosure<ModelType>, failure: @escaping ErrorClosure) {
        assertionFailure(String(describing: self) + " is abstract. You must implement " + #function)
    }
    
    open func reset(stashingLastPageInfo: Bool = true) {
        searchQuery = nil
        resetLastPageInfo(stashing: stashingLastPageInfo)
    }

    open func resetLastPageInfo(stashing: Bool = true) {
        assertionFailure(String(describing: self) + " is abstract. You must implement " + #function)
    }

    open func restoreLastPageInfo() {
        assertionFailure(String(describing: self) + " is abstract. You must implement " + #function)
    }
}

open class CursorPaginator<ModelType: Identifiable & Decodable>: Paginator<ModelType> {
    open var lastPage: CursorPage<ModelType>?
    private var stashedLastPage: CursorPage<ModelType>?

    open override var hasLoadedFirstPage: Bool {
        return lastPage != nil
    }

    open override var hasLoadedAllPages: Bool {
        guard let lastPage = lastPage else { return false }
        return lastPage.nextPageCursor == nil
    }

    open override func resetLastPageInfo(stashing: Bool = true) {
        if stashing { stashedLastPage = lastPage }
        lastPage = nil
    }

    open override func restoreLastPageInfo() {
        lastPage = stashedLastPage
    }
}

open class OffsetPaginator<ModelType: Identifiable & Decodable>: Paginator<ModelType> {
    open var lastPage: OffsetPage<ModelType>?
    private var stashedLastPage: OffsetPage<ModelType>?

    open override var hasLoadedFirstPage: Bool {
        return lastPage != nil
    }

    open override var hasLoadedAllPages: Bool {
        guard let lastPage = lastPage else { return false }
        return lastPage.page.position.next == nil
    }

    open override func resetLastPageInfo(stashing: Bool = true) {
        if stashing { stashedLastPage = lastPage }
        lastPage = nil
    }

    open override func restoreLastPageInfo() {
        lastPage = stashedLastPage
    }
}


public enum PaginatorError: Error {
    case noResults
}

public struct CursorPage<E: Hashable & Decodable>: Decodable {
    public let nextPageCursor: String?
    public let data: [E]
    public let remaining: Int
}

public struct OffsetPage<M: Hashable & Decodable>: Decodable {
    public var page: PageInfo
    /// The paginated data.
    public var data: [M]

}

// MARK: - Pagination helper structs

public struct Position: Codable {
    public var current: Int
    public var next: Int?
    public var previous: Int?
    public var max: Int
}

public struct PageData: Codable {
    public var per: Int
    public var total: Int
}

public struct PageInfo: Codable {
    public var position: Position
    public var data: PageData

}
