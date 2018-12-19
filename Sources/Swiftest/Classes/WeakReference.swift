//
//  WeakReference.swift
//  Swiftest
//
//  Created by Brian Strobach on 3/30/16.
//  Copyright © 2018 Appsaurus
//

import Foundation

open class WeakReference<T: AnyObject> {
    open weak var object: T?
    
    public init(object: T) {
        self.object = object
    }
}
