//
//  main.swift
//  Swift之扩展
//
//  Created by mac on 2020/9/23.
//  Copyright © 2020 Dever.G. All rights reserved.
//

import Foundation

//MARK: 计算属性
extension Double {
    var km: Double { self / 1_000.0 }
    var m: Double { self }
    var dm: Double { self * 10.0 }
    var cm: Double { self * 100.0 }
    var mm: Double { self * 1_000.0 }
}

var a = 10.0
print(a.km) //0.01
print(15.4.cm) //1540.0

//MARK: 下标
extension Array {
    subscript(nullable idx: Int) -> Element? {
        if (startIndex ..< endIndex).contains(idx) {
            return self[idx]
        }
        return nil
    }
}

var array = [10,20,30,40]
print(array[nullable: 5] as Any) //nil
print(array[nullable: 2] as Any) //Optional(30)

//MARK: 方法和嵌套类型
extension Int {
    //重复执行task函数
    func repetitions(task: () -> () ) {
        for _ in 0 ..< self {
            task()
        }
    }
    //求平方
    mutating func square() -> Int {
        self = self * self
        return self
    }
    
    /** 增加套嵌类型 */
    enum kind {
        case nagative, zero, positive
    }
    var kind: kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .nagative
        }
    }
}

4.repetitions { // 执行 print 4遍
    print("aa")
}
var b = 4
print(b.square()) //16

print(20.kind) //positive
print((-20).kind) //nagative

//MARK: 协议、初始化器
class Person {
    var age: Int
    var name: String
    init(age: Int, name: String) {
        self.age = age
        self.name = name
    }
}

extension Person : Equatable {
    static func == (left: Person, right: Person) -> Bool {
        left.age == right.age && left.name == right.name
    }
    convenience init() {
        self.init(age: 0,name: "")
    }
}

struct Point {
    var x = 0
    var y = 0
}
extension Point {
    init(_ point: Point) {
        self.init(x: point.x, y: point.y)
    }
}
var p1 = Point() //编译器生成的默认构造器
var p2 = Point(x: 10) //编译器生成的默认构造器
var p3 = Point(y: 20) //编译器生成的默认构造器
var p4 = Point(x: 20, y: 30) //编译器生成的默认构造器
var p5 = Point(p4)

