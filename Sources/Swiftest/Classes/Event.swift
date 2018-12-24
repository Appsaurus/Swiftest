//
//  Event.swift
//  Pods
//
//  Created by Brian Strobach on 8/3/17.
//
//

import Foundation

public class TypedEventSubscription<ValueType> {
    public var callback: ClosureIn<ValueType>
    public init(callback: @escaping ClosureIn<ValueType>) {
        self.callback = callback
    }
    
}

public class TypedEvent<T> {
    
    public typealias EventHandler = (T) -> Void
    public var notificationsEnabled: Bool = true
    public var subscriptions = NSMapTable<AnyObject, TypedEventSubscription<T>>(keyOptions: NSPointerFunctions.Options.weakMemory)
    
    public func notifySubscribers(ofValueUpdate updatedValue: T) {
        guard notificationsEnabled else { return }
        for sub in subscriptions.objectEnumerator()?.allObjects ?? [] {
            (sub as? TypedEventSubscription<T>)?.callback(updatedValue)
        }
    }
    
    public func notifySubscribers(ofValueUpdate updatedValue: T?) {
        guard notificationsEnabled else { return }
        for sub in subscriptions.objectEnumerator()?.allObjects ?? [] {
            (sub as? TypedEventSubscription<T?>)?.callback(updatedValue)
        }
    }
    
    public init() {
        
    }

    @discardableResult
    public func notify(observer: AnyObject, onOccurrence callback: @escaping ClosureIn<T>) -> TypedEventSubscription<T> {
        let sub = TypedEventSubscription<T>(callback: callback)
        subscriptions.setObject(sub, forKey: observer)
        return sub
    }
}

public class EventSubscription {
    public var callback: VoidClosure
    public init(callback: @escaping VoidClosure) {
        self.callback = callback
    }
    
}

public class Event {
    
    public typealias EventHandler = VoidClosure
    public var notificationsEnabled: Bool = true
    public var subscriptions = NSMapTable<AnyObject, EventSubscription>(keyOptions: NSPointerFunctions.Options.weakMemory)
    
    public func notifySubscribersOfOccurrence() {
        guard notificationsEnabled else { return }
        for sub in subscriptions.objectEnumerator()?.allObjects ?? [] {
            (sub as? EventSubscription)?.callback()
        }
    }
    
    public init() {
        
    }
    
    @discardableResult
    public func notify(observer: AnyObject, onOccurrence callback: @escaping VoidClosure) -> EventSubscription {
        let sub = EventSubscription(callback: callback)
        subscriptions.setObject(sub, forKey: observer)
        return sub
    }
}
