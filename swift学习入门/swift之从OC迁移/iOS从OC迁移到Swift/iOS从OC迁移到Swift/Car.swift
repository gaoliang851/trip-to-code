//
//  Car.swift
//  iOS从OC迁移到Swift
//
//  Created by mac on 2020/12/6.
//

import UIKit
@objc(SwiftCar)
@objcMembers class Car: NSObject {
    var price: Double
    @objc(name)
    var band: String
    init(price: Double, band: String){
        self.price = price
        self.band = band
    }
    @objc(drive)
    func run() {
        print(price,band,"run")
    }
    static func run() {
        print("Car run")
    }
}

extension Car {
    @objc(exec)
    func test() {
        print(price,band,"test")
    }
}

@objcMembers class Person: NSObject {
    func test1(v1: Int) { print("test1(v1:)") }
    func test2(v1: Int,v2: Int) { print("test2(v1:v2:)") }
    func test2(_ v1: Double, _ v2: Double)  { print("test2(_:_:)") }
    func run() {
        perform(#selector(test1))
        perform(#selector(test1(v1:)))
        perform(#selector(test2(v1:v2:)))
        perform(#selector(test2(_:_:)))
        //根据test2名称可以找到两个方法，使用as可以根据参数匹配到相应的方法
        perform(#selector(test2 as (Double,Double) -> Void))
    }
}
