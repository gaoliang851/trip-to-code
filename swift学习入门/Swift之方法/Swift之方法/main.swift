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



//let fun1 = Person(age: 10).run
//fun1(20) //func run  10 20
////let fun2 = Person.run
////fun2(20) //static func run 20
//
//let fun3: (Person) -> ((Int) -> ()) = Person.run
//let fun4 = Person.run

//MARK: 把方法赋值给let/var
do {
    //MARK: 获取实例方法
    struct Person {
        var age: Int
        func run(_ v: Int) { print("func run ",age,v)}
    }
    //第一种，通过实例获取方法
    let p = Person(age: 10)
    let fun1 = p.run
    fun1(10)//func run  10 10
    //第二种通过类型获取方法，绑定实例
    let fun2 = Person.run //fun2的类型： (Person) -> ((Int) -> ())
    let fun3 = fun2(p) //绑定实例，获取实例方法
    fun3(15) //func run  10 15
}

do {
    //MARK: 获取类型方法
    struct Person {
        var age: Int
        static func run(_ v: Int) { print("static func run ",v)}
    }
    
    let fun = Person.run
    fun(20)//static func run  20
}



