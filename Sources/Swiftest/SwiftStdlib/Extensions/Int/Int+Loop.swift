//
//  Int+Loop.swift
//  Swiftest
//
//  Created by Brian Strobach on 12/18/18.
//

extension Int {
    public func times(_ run: () -> ()) {
        if self > 0 {
            for _ in 0..<self {
                run()
            }
        }
    }
    
    public func times(_ run: (_ index: Int) -> ()) {
        if self > 0 {
            for i in 0..<self {
                run(i)
            }
        }
    }
    
    public func times(_ run: @autoclosure () -> ()) {
        if self > 0 {
            for _ in 0..<self {
                run()
            }
        }
    }
    
    public func times(_ run: () throws -> ()) throws{
        if self > 0 {
            for _ in 0..<self {
                try run()
            }
        }
    }
    
    public func times(_ run: (_ index: Int) throws -> ()) throws{
        if self > 0 {
            for i in 0..<self {
                try run(i)
            }
        }
    }
    
    public func times(_ run: @autoclosure () throws -> ()) throws{
        if self > 0 {
            for _ in 0..<self {
                try run()
            }
        }
    }
}
