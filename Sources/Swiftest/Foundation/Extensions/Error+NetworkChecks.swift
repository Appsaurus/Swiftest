//
//  NSErrorExtensions.swift
//  Swiftest
//
//  Created by Brian Strobach on 4/6/16.
//  Copyright © 2018 Appsaurus
//

#if canImport(Foundation)
import Foundation

extension NSError {
    public func isNetworkConnectionError() -> Bool {
        
        if let innerError = self.userInfo[NSString(string: NSUnderlyingErrorKey) as String] as? NSError {
            if innerError.isNetworkConnectionError() {
                return true
            }
        }
        
        switch self.code {
        case NSURLErrorTimedOut,
             NSURLErrorCannotFindHost,
             NSURLErrorCannotConnectToHost,
             NSURLErrorNetworkConnectionLost,
             NSURLErrorDNSLookupFailed,
             NSURLErrorNotConnectedToInternet,
             NSURLErrorInternationalRoamingOff,
             NSURLErrorCallIsActive,
             NSURLErrorDataNotAllowed:
            return true
        default:
            return false
        }
        
    }
    
    public func isUserNetworkConnectionUnavailableError() -> Bool {
        
        if let innerError = self.userInfo[NSString(string: NSUnderlyingErrorKey) as String] as? NSError {
            if innerError.isUserNetworkConnectionUnavailableError() {
                return true
            }
        }
        
        switch self.code {
        case NSURLErrorNotConnectedToInternet,
             NSURLErrorInternationalRoamingOff,
             NSURLErrorCallIsActive,
             NSURLErrorDataNotAllowed:
            return true
        default:
            return false
        }
        
    }
}

extension Error {
    public func isNetworkConnectionError() -> Bool {
        return (self as NSError).isNetworkConnectionError() 
    }
    
    public func isUserNetworkConnectionUnavailableError() -> Bool {
        return (self as NSError).isUserNetworkConnectionUnavailableError() 
    }
}

#endif
