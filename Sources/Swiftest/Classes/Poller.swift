//
//  Poller.swift
//  Swiftest
//
//  Created by Brian Strobach on 3/28/16.
//  Copyright © 2018 Appsaurus
//

import Foundation

open class Poller{
    open var running: Bool = false
    open var refreshing: Bool = false
    open var refreshFrequency: Double = 60
    open lazy var timer: Timer = {
        return Timer.scheduledTimer(timeInterval: self.refreshFrequency, target: self, selector: #selector(Poller.refreshTimerFired), userInfo: nil, repeats: true)
    }()
    public init() {

    }
    
    deinit {
        timer.invalidate()
    }
    open func startRefreshThread() {
        running = true
        timer.fire()
    }
    
    open func stop() {
        running = false
        timer.invalidate()
    }
    
    @objc open func refreshTimerFired(){
        if !needsRefresh(){
            refresh()
        }
    }
    
    open func needsRefresh() -> Bool {
        return  !self.refreshing
    }
    
    //Override to add network polling implementation. Call super to maintain state
    @objc open func refresh() {
        self.refreshing = true
    }
    
    open func refreshSucceeded(){
        self.refreshing = false
    }
    
    //TODO: Consider implementing retries
    open func refreshFailed(){
        self.refreshing = false
    }
}
