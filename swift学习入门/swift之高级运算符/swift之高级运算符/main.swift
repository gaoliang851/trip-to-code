//
//  main.swift
//  swift之高级运算符
//
//  Created by mac on 2020/9/21.
//  Copyright © 2020 Dever.G. All rights reserved.
//


//MARK: 溢出运算符
func overflow() {
    let min = UInt8.min //0
    print(min &- 1) //255
    
    let max = UInt8.max //255
    print(max &+ 1) //0
    print(max &* 2) //254
}

//overflow()

//MARK: 运算符重载
func operatorOverload() {
    
//    p1 + p2
//    print(p1 + p2)
}
operatorOverload()


//struct Point {
//    var x:Int = 0, y:Int = 0
//    static func + ( p1:Point, p2: Point) -> Point {
//        Point(x: p1.x + p2.x, y: p1.y + p2.y)
//    }
//    static func - (p1: Point, p2: Point) -> Point {
//        Point(x: p1.x - p2.x, y: p1.y - p2.y)
//    }
//    static func == (p1: Point, p2: Point) -> Bool {
//        (p1.x == p2.x ) && (p2.y == p2.y)
//    }
//    static prefix func - (p1: Point) -> Point {
//        Point(x: -p1.x , y: -p1.y)
//    }
//    static func += (p1: inout Point,p2: Point) {
//        p1 = p1 + p2
//    }
//    static prefix func ++ (p: inout Point) -> Point {
//        p += Point(x: 1, y: 1)
//        return p
//    }
//    static postfix func ++ (p: inout Point) -> Point {
//        let tmp = p
//        p += Point(x: 1, y: 1)
//        return tmp
//    }
//}
//
//var p1 = Point(x: 20, y: 19)
//var p2 = Point(x: 15, y: 10)
//print(p1 + p2) //Point(x: 35, y: 29)
//print(p1 - p2) //Point(x: 5, y: 9)
//print(p1 == p2) //false
//print(-p1) //Point(x: -20, y: -19)
//p1 += p2
//print(p1) //Point(x: 35, y: 29)
//var p3 = Point(x: 10, y: 10)
//print(++p3) //Point(x: 11, y: 11)
//var p4 = Point(x: 10, y: 10)
//print(p4++)//Point(x: 10, y: 10)

//MARK: Equatable
class Person : Equatable {
    var age: Int
    init(age: Int) {
        self.age = age
    }
    static func == (lhs: Person, rhs: Person) -> Bool {
        lhs.age == rhs.age
    }
}

let person1 = Person(age: 10)
let person2 = Person(age: 25)
print(person1 == person2) //false
print(person1 != person2) //true

enum Answer {
    case wrong
    case right
}
var answer1 = Answer.wrong
var answer2 = Answer.wrong
print(answer1 == answer2) //true

enum Answer2 : Equatable {
    case wrong(Int)
    case right
}
var a1 = Answer2.wrong(10)
var a2 = Answer2.right
print(a1 == a2) //false

enum Answer3 : Equatable {
    case wrong(Int,String)
    case right
}
var anw1 = Answer3.wrong(10,"abc")
var anw2 = Answer3.wrong(10,"ddd")
print(anw1 == anw2) //false

struct Student : Equatable{
    var age: Int
    var name: String
    init(age: Int,name: String) {
        self.age = age
        self.name = name
    }
}
var stu1 = Student(age: 20, name: "Jack")
var stu2 = Student(age: 30, name: "Peck")
print(stu1 == stu2) //false
stu1.age = 30
stu1.name = "Peck"
print(stu1 == stu2) //true

var person_1 = Person(age: 20)
var person_2 = Person(age: 20)
print(person_1 === person_2) //false

person_1 = person_2
print(person_1 === person_2) //true

//MARK: Comparable
//score大的比较大，若score相等，age小的比较大
struct Teacher : Comparable {
    var age: Int
    var score: Int
    
    static func < (lhs: Teacher, rhs: Teacher) -> Bool {
        (lhs.score < rhs.score) || (lhs.score == rhs.score && lhs.age > rhs.age)
    }
    static func > (lhs: Teacher, rhs: Teacher) -> Bool {
        (lhs.score > rhs.score) || (lhs.score == rhs.score && lhs.age < rhs.age)
    }
    static func <= (lhs: Teacher, rhs: Teacher) -> Bool {
        !(lhs > rhs)
    }
    static func >= (lhs: Teacher, rhs: Teacher) -> Bool {
        !(lhs < rhs)
    }
}

var t1 = Teacher(age: 20, score: 100)
var t2 = Teacher(age: 18, score: 98)
var t3 = Teacher(age: 20, score: 100)
print(t1 > t2)  // true
print(t1 >= t2) //true
print(t1 < t3) //false

//MARK: 自定义运算符

prefix operator +++
struct PrefixOperatorStruct {
    var value:Int
    static prefix func +++ (p: inout PrefixOperatorStruct) {
        p.value += 2
    }
}

var p = PrefixOperatorStruct(value: 10)
+++p
print(p) //PrefixOperatorStruct(value: 12)

postfix operator --!
struct PostfixOperatorSturct {
    var value: Int
    static postfix func --! (p: inout PostfixOperatorSturct) {
        p.value /= 4
    }
}
var po = PostfixOperatorSturct(value: 8)
po--!
print(po) //PostfixOperatorSturct(value: 2)

infix operator +-: PlusMinusPrecedence
precedencegroup PlusMinusPrecedence {
    associativity: none
    higherThan: AdditionPrecedence
    lowerThan: MultiplicationPrecedence
    assignment: false
}

struct Point {
    var x: Int,y: Int
    static func +- (left: Point, right: Point) -> Point {
        print("+-")
        return Point(x: left.x + right.x, y: left.y - right.y)
    }
    static func +- (left: Point?, right: Point) -> Point {
        print("+-?")
        return Point(x: left?.x ?? 0 + right.x, y: left?.y ?? 0 - right.y)
    }
}

struct Stu {
    var point: Point
}
var aStu: Stu? = nil
var result = aStu?.point +- Point(x: 10, y: 10) // result类型是 Point
print(result) // +-? Point(x: 10, y: -10)

var otherStu: Stu? = Stu(point: Point(x: 5, y: 5))
var otherresult = otherStu?.point +- Point(x: 10, y: 10) // otherresult类型是 Point
print(otherresult) // +- Point(x: 5, y: 5)
