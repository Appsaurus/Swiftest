//
//  ReadWriteLock.swift
//  Swiftest
//
//  Created by Brian Strobach on 4/12/16.
//  Copyright © 2018 Appsaurus
//

#if !os(Linux)

import Foundation

public func lock(_ object: AnyObject, closure: () -> Void) {
    🔒(object) {
        closure()
    }
}

///Emoji read/write locking because it is too good to pass up
public func 🔒(_ object: AnyObject, closure: () -> Void) {
    objc_sync_enter(object)
    closure()
    objc_sync_exit(object)
}

#endif
