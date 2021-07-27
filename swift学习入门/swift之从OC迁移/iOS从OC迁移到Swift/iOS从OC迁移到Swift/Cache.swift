//
//  Cache.swift
//  iOS从OC迁移到Swift
//
//  Created by mac on 2020/12/8.
//

import Foundation

//class Cache {
//    private static var data = [String:Any]()
//    //最多允许多个线程同时访问，value就填几
//    private static var lock = DispatchSemaphore(value: 1)
//    static func set(_ key:String,_ value: Any) {
//        lock.wait()
//        defer { lock.signal() }
//        data[key] = value
//    }
//}

class Cache {
    private static var data = [String:Any]()
    private static var lock = NSRecursiveLock()
    static func set(_ key:String,_ value: Any) {
        lock.lock()
        defer { lock.unlock() }
        data[key] = value
    }
}
