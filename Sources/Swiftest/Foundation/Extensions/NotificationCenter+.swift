//
//  NotificationCenter+.swift
//  Pods
//
//  Created by Brian Strobach on 1/14/17.
//
//

#if canImport(Foundation)
import Foundation

extension NotificationCenter{
    open func post(name aName: String, object: Any?){
        post(name: Notification.Name(rawValue: aName), object: object)
    }
    open func post(name: Notification.Name){
        post(name: name, object: nil)
    }
    public static func post(name: Notification.Name, object: Any?){
        NotificationCenter.default.post(name: name, object: object)
    }    
    public static func post(name: Notification.Name){
        NotificationCenter.default.post(name: name)
    }
}

#endif
