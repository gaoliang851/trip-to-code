//
//  main.swift
//  Swift之方法
//
//  Created by mac on 2020/9/3.
//  Copyright © 2020 Dever.G. All rights reserved.
//

import Foundation

//MARK: 实例方法和类型方法
func InstanceAndStaticMethod() {
    class Car {
        static var count = 0
        init() {
            Car.count += 1
        }
        static func getCount() -> Int {
            count
        }
    }

    _ = Car()
    _ = Car()
    print(Car.getCount())//2
}

//InstanceAndStaticMethod()


//MARK:mutating特性
func mutatingMethod() {
    struct Point {
        var x = 0.0,y = 0.0
        mutating func moveBy(deltaX: Double,deltaY: Double) {
            x += deltaX
            y += deltaY
        }
    }
    
    enum StateSwitch {
        case low,middle,high
        mutating func next() {
            switch self {
            case .low:
                self = .middle
            case .middle:
                self = .high
            case .high:
                self = .low
            }
        }
    }
    
    var state = StateSwitch.middle
    state.next()
    print(state)
}

//MARK: @discarableResult

func testDiscarableResult() {
    struct Point {
        var x = 0.0,y = 0.0
        @discardableResult mutating func moveBy(deltaX: Double) -> Double {
            x += deltaX
            return x
        }
    }
    
    var p = Point()
    p.moveBy(deltaX: 9)
}

