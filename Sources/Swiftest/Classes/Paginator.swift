//
//  Pagination.swift
//  Datastorus
//
//  Created by Brian Strobach on 3/29/16.
//  Copyright © 2018 Appsaurus
//

import Foundation

public typealias Paginatable = Equatable// & ApiObjectProtocol
public typealias PaginationResultsClosure<M: Paginatable> = ((items: [M], isLastPage: Bool)) -> Void
public typealias PaginationResult<M: Paginatable> = (items: [M], isLastPage: Bool)

open class Paginator<ModelType: Any> where ModelType: Paginatable {
    
    open var searchQuery: String?
    open var nextPageToken: String?
    
    open var hasLoadedAllPages: Bool {
        return nextPageToken == nil
    }
    
    public init() {
        
    }
    
    open func fetchNextPage(success: @escaping PaginationResultsClosure<ModelType>, failure: @escaping ErrorClosure) {
        assertionFailure(String(describing: self) + " is abstract. You must implement " + #function)
    }
    
    open func reset() {
        searchQuery = nil
        nextPageToken = nil
    }
}

public enum PaginatorError: Error {
    case noResults
}
