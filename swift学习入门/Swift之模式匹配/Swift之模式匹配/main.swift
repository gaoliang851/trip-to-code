//
//  main.swift
//  Swift之模式匹配
//
//  Created by mac on 2020/11/15.
//

import Foundation

//MARK: 通配符模式
enum Life {
    case human(name: String, age: Int?)
    case animal(name: String, age: Int?)
}
func chcek(_ life: Life) {
    switch life {
    case .human(let name, _): //匹配 .human,并把关联的name值复制给let name
        print("human:", name)
    case .animal(let name, _?): //匹配 .animal并且age值不为nil,并把关联的name值复制给let name
        print("animal:",name)
    default:
        print("other")
    }
}
chcek(Life.animal(name: "aidi", age: nil)) //other
chcek(Life.human(name: "Jock", age: nil))   //human: Jock
chcek(Life.animal(name: "Lili", age: 30))   //animal: Lili

var v: Int? = 29
switch v {
case let v?: //非空时匹配，并且将值赋值给v
    print(v)
case nil: //为nil时匹配
    print("nil")
}

//MARK: 值绑定模式
let point = (3,2)
print(point.0)
print(point.1)

switch point {
    case let(x,y):
        print("This point at \(x) ,\(y)")
}

//MARK: 元组模式
print("--元组模式--")
let points = [(0,0),(1,0),(2,0)]
for (x,_) in points {
    print(x)
}

let name: String? = "jack"
let age = 18
var info: Any = [1,2]
switch (name, age, info) {
case (_?, _, _ as String):
    print("case")
default:
    print("default")
}

var scores = ["jack": 98, "rose": 100, "kate": 86]
for (name, score) in scores {
    print("\(name) : \(score)")
}
for kv in scores {
    print(kv.key)
    print(kv.value)
}

//MARK: Case模式
let number = 2

//原来的写法
if number >= 0 && number <= 9 {
    print("[0 , 9]")
}

if case 0...9 = number {
    print("[0 , 9]")
}

func test() {
    guard case 0...9 = number else {
        return
    }
    print("[0 , 9]")
}
test()

switch number {
case 0...9 :
    print("[0 , 9]")
default: break
}

let ages: [Int?] = [2,3,nil,5]
for case nil in ages {
    print("有nil值")
    break
}

let pointArray = [(1,0), (2,1), (3, 0)]
for case let (x, 0) in pointArray {
    print("x = \(x)")
}

for temp in pointArray {
    switch temp {
    case let (x, 0):
        print(x)
    default:
        break
    }
}

//MARK: 可选模式
let aNumber: Int? = 42
//case .some(let x)，匹配非空值，并且使用值绑定赋值给x
if case .some(let x) = aNumber { print(x) }

let numbers: [Int?] = [nil, 2, 3, nil, 5]
//使用 let number?，匹配非空值，并且使用值绑定赋值给number
for case let number? in numbers {
    print(number) //2 3 5
}

for number in numbers {
    if let aNumber = number {
        print(":",aNumber)
    }
}
 
func check(_ num: Int?) {
    switch num {
    case 2?:
        print("2")
    case 4?:
        print("4")
    case 6?:
        print("6")
    case _?:
        print("other")
    case _:
        print("nil")
    }
}
check(4)//4
check(8)//other
check(nil) //nil

//MARK: 类型转换模式
let num:Any = 6.0
switch num {
case is Int:
    print("is Int",num)
case let n as Double:
    print("as Double",n + 1)
default:
    break
}

class Animal { func eat() { print(type(of: self), "eat") }}
class Dog: Animal {
    func run() -> () {
        print(type(of: self),"run")
    }
}
class Cat: Animal {
    func jump() -> () {
        print(type(of: self),"jump")
    }
}
func check(_ animal: Animal) {
    switch animal {
    case let dog as Dog: //这里进行了强转，类似于 let dog = (Dog)animal
        dog.eat()
        dog.run()
    case is Cat:
        animal.eat()
    default:break
    }
}

//MARK: 表达式模式
let aPoint = (1, 2)
switch aPoint {
case (0,0):
    print("(0,0) is at the origin")
case (-2...2,-2...2):
    print("(\(aPoint.0),\(aPoint.1)) is near origin")
default:
    print("The point is at (\(aPoint.0),\(aPoint.1)")
}

struct Student {
    var score = 0
    var name = ""
    static func ~= (pattern: Int, value: Student) -> Bool {
        value.score >= pattern
    }
    static func ~= (pattern: ClosedRange<Int>, value: Student) -> Bool {
        pattern.contains(value.score)
    }
    static func ~= (pattern: Range<Int>, value: Student) -> Bool {
        pattern.contains(value.score)
    }
}
var stu = Student(score: 75, name: "Jack")
switch stu {
case 100: print(">=100")
case 90: print(">=90")
case 80..<90: print("[80,90)")
case 60...79: print("[60,79]")
case 0: print(">=0")
default: break
} //[60,79]

if case 60 = stu {
    print(">=60")
} //>=60

var infoGroup = (Student(score: 70, name: "Jack"),"及格")
switch infoGroup {
case let (60,text):
    print(text)
default:
    break
}  //及格

extension String {
    static func ~=(pattern: (String) -> Bool, value: String) -> Bool {
        pattern(value)
    }
}

func hasPrefix(_ prefix: String) -> ((String) -> Bool) {
    return {
        //这个in就是为了分开函数的参数和函数体的一个固定语法，这个语法只在回调函数中使用。
        //因为返回值的类型是确定的，(String) -> Bool,所以str是String类型
        //当然也可以不写这个In来声明形参，直接使用$0来代表第一个参数
         str in
            str.hasPrefix(prefix)
    }
}

//上面的函数可以简写为如下：
func hasPrefixShort(_ prefix: String) -> ((String) -> Bool) {
    {
        $0.hasPrefix(prefix)
    }
}

func hasSuffix(_ suffix: String) -> ((String) -> Bool) {
    return {
        aString in
        return aString.hasSuffix(suffix)
    }
}
//上面的函数可以简写为：
func hasSuffixShort(_ suffix: String) -> ((String) -> Bool) {
    { $0.hasSuffix(suffix) }
}

var otherString = "Jack"
switch otherString {
case hasSuffix("k"),hasPrefix("J"):
    print("以k结尾或以J开头")
default: break
}  //以k结尾或以J开头


func isEven(_ i: Int) -> Bool {
    i % 2 == 0
}
func isOdd(_ i: Int) -> Bool {
    i % 2 != 0
}

extension Int {
    static func ~= (pattern: (Int) -> Bool, value: Int) -> Bool {
        pattern(value)
    }
}
var otherNumber = 9
switch otherNumber {
case isEven: //这i1
    print("是偶数")
case isOdd:
    print("是奇数")
default: break
} //是奇数

prefix operator ~>
prefix operator ~>=
prefix operator ~<
prefix operator ~<=
prefix func ~>(_ i: Int) -> ((Int) -> Bool) {
    return {
        number in
            number > i
    }
}
prefix func ~>=(_ i: Int) -> ((Int) -> Bool) {
    { $0 >= i }
}
prefix func ~<(_ i: Int) -> ((Int) -> Bool) {
    { $0 < i }
}
prefix func ~<=(_ i: Int) -> ((Int) -> Bool) {
    { $0 <= i }
}

var number2 = 6
switch number2 {
case ~>=0: print("大于等于0")
case ~>10: print("大于10")
default: break
} //大于等于0

//MARK: where

var data = (10,"Jack")
switch data {
case let (age, _) where age > 10:
    print(data.1, "age>10")
case let (age, _) where age > 0:
    print(data.1, "age>0")
default: break
}// Jack age>0

var theNumbers = [10,20,44,23,55]
for number in theNumbers where number > 30 {
    print(number)
}//44 55

protocol Stackable {
    associatedtype Element
}
protocol Container {
    associatedtype Stack: Stackable where Stack.Element: Equatable
}

func equal<S1: Stackable,S2: Stackable>(_ s1: S1,_ s2: S2) -> Bool
    where S1.Element == S2.Element, S1.Element: Hashable {
    return false
}

extension Container where Self.Stack.Element: Hashable { }
