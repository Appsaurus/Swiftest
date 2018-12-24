//
//  GCDExtensions.swift
//  Swiftest
//
//  Created by Brian Strobach on 1/13/17.
//  Copyright © 2018 Appsaurus
//

#if canImport(Foundation)
import Foundation

extension DispatchQueue {
    
    public func asyncAfter(seconds: Int, execute work: @escaping @convention(block) () -> Swift.Void) {
        let deadlineTime = DispatchTime.now() + .seconds(seconds)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
            work()
        }
    }

}

extension DispatchQueue {
    public class func mainSyncSafe(execute work: () -> Void) {
        if Thread.isMainThread {
            work()
        } else {
            DispatchQueue.main.sync(execute: work)
        }
    }
    
    public class func mainSyncSafe<T>(execute work: () throws -> T) rethrows -> T {
        if Thread.isMainThread {
            return try work()
        } else {
            return try DispatchQueue.main.sync(execute: work)
        }
    }
}

#endif
