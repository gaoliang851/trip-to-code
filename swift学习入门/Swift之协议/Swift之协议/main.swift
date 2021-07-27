//
//  main.swift
//  Swift之协议
//
//  Created by mac on 2020/9/8.
//  Copyright © 2020 Dever.G. All rights reserved.
//

import Foundation



//MARK: 协议
protocol Drawable {
    func draw()
    var x: Int { get set }
    var y: Int { get }
    subscript(index: Int) -> Int { get set }
}

protocol Test1 { }
protocol Test2 { }
protocol Test3 { }
protocol Test4 {
    var x: Int { get }
}
func testProtocol1() {
    struct Test1: Test4 {
        let x : Int = 0
    }
    class Person: Drawable {
        var x: Int = 0
        let y: Int = 0
        func draw() {  }
        subscript(index: Int) -> Int {
            set { }
            get { index }
        }
    }
    
    class Person2: Drawable {
        var x : Int {
            get { 0 }
            set {}
        }
        var y: Int { 0 }
        func draw() { }
        subscript(index: Int) -> Int {
            set { }
            get { 1 }
        }
    }
}

//MARK: 协议中的属性
func testProtocol2() {
    class Person1 : Drawable {
        var x: Int = 0
        let y: Int = 0 //只读，get
        func draw() {
            print("Person1 draw")
        }
        subscript(index: Int) -> Int {
            set { }
            get { index }
        }
    }
    class Person2 : Drawable {
        var x: Int = 0
        var y: Int { 0 }
        func draw() { print("Person2 draw") }
        subscript(index: Int) -> Int {
            set {}
            get { index }
        }
    }
}

//MARK: static、class
protocol Writeable {
    static func write()
}

func testProtocol3() {
    class Student: Writeable {
        static func write() {
            print("Student write")
        }
    }
    class Wirtor: Writeable {
        class func write() {
            print("Wirtor write")
        }
    }
    struct Person: Writeable {
        static func write() {
            print("Person write")
        }
    }
}

//MARK: mutating
protocol MutatingProtocol {
    mutating func change()
}
func testProtocol4() {
    class Size: MutatingProtocol {
        func change() {
            print("change")
        }
    }
    struct Point: MutatingProtocol {
        var x: Int = 0
        mutating func change() {
            x = 10
        }
    }
}
//MARK: init
protocol PointProtocol {
    init(x: Int ,y: Int)
}

protocol Livable {
    init(age: Int)
}

func testProtocol5() {
    class Size : PointProtocol {
        required init(x: Int, y: Int) { }
    }
    final class Point : PointProtocol {
        init(x: Int, y: Int) { }
    }
    class Person {
        init(age: Int) {}
    }
    class Student: Person, Livable {
        required override init(age: Int) {
            super.init(age: age)
        }
    }
}
//MARK: init? 、init!
protocol InitProtocol {
    init()
    init?(age: Int)
    init!(no: Int)
}
func testProtocol6() {
    class Person : InitProtocol{
//        required init(){}
        required init!() {}
        
        required init?(age: Int) { }
//        required init!(age: Int) {}
//        required init(age: Int) {}
        
        
//        required init!(no: Int) { }
//        required init?(no: Int) {}
        required init(no: Int) { }
    }
}
testProtocol6()

//MARK: 协议的继承
protocol SuperProtocol {
    func breath()
}
protocol ChildProtocol: SuperProtocol {
    func run()
}

func testProtocol7() {
    class Person : ChildProtocol {
        func breath() { }
        func run() { }
    }
}

//MARK: 协议组合
protocol FirstProtocol : AnyObject{ }
protocol SecondProtocol { }
func testProtocol8 (){
    class Person { }
    
//    var stu: FirstProtocol = Person()
    
    //接受Person或者其子类的实例
    func fn0 (obj: Person) { }
    
    //接受遵循FirstProtocol协议的实例
    func fn1 (obj: FirstProtocol) { }
    
    //接受遵循FirstProtocol和SecondProtocol协议的实例
    func fn2 (obj: FirstProtocol & SecondProtocol) { }
    
    //接受遵循FirstProtocol和SecondProtocol协议,并且是Person或者其子类的实例
    func fn3 (obj: Person & FirstProtocol & SecondProtocol) { }
}

//MARK: CaseIterable
func caseIterableTest() {
    enum Season: CaseIterable {
        case spring, summer, autumn, winter
    }
    let seasons = Season.allCases
    print(seasons.count) //4
    for season in seasons {
        print(season) //spring summer autumn winter
    }
}
//caseIterableTest()

//MARK: CustomStringConvertible
func customStringConvertible() {
    class Person : CustomStringConvertible, CustomDebugStringConvertible {
        var age = 0
        var description: String { "person_\(age)" }
        var debugDescription: String { "debug_person_\(age)"}
    }
    let p = Person()
    print(p) //person_0
    debugPrint(p) //debug_person_0
}
//customStringConvertible()

//MARK: Any,AnyObject
protocol AnyTypeProtocol: Any { }
protocol AnyObjectProtocol: AnyObject { }
protocol ClassProtocol: class { }
func testAnyAndAnyObject() {
    class Person: AnyTypeProtocol, AnyObjectProtocol,ClassProtocol { }
    struct Student : AnyTypeProtocol { }
    
    //创建一个能存放任意类型的变量
    var stu: Any = 10
    stu = "Jack"
    stu = Person()
    
    //创建1个能存放任意类型的数组
    var data = Array<Any>()//var data = [Any]()
    data.append(1)
    data.append(3.14)
    data.append(Student())
    data.append("Jack")
    data.append({ 10 })
    
}
//testAnyAndAnyObject()

//MARK: is
protocol IsProtocol { }
func testIs() {
    class Person { }
    class Student: Person, IsProtocol { }
    var stu : Any = 10
    print(stu is Int)//true
    
    stu = "Jack"
    print(stu is String)//true
    
    stu = Student()
    print(stu is Person)//true
    print(stu is Student)//true
    print(stu is IsProtocol)//true
}
//testIs()

//MARK: as
func testAs() {
    class Person { }
    class Student: Person, IsProtocol {
        func study() {
            print("Student study")
        }
    }
    var stu: Any = 10
    stu = Student()
    
    //(stu as? Student)?.study() 等价于下面两句：
    let result =  stu as? Student // result 是 Student? 类型
    result?.study()
    
    //(stu as! Student).study() 等价于下面两句。
    //也等价于 (stu as? Student)!.study()
    let result2 = stu as! Student // result2 是Student类型
    result2.study()
    
    //------as------
    var data = [Any]()
    data.append(Int("123") as Any)
    
    let d = 10 as Double
    print(d)//10.0
    
    let student = Student()
    let person = student as Person
}
//testAs()

//MARK: 元类型
func testXType() {
    class Person { }
    class Student : Person { }
    var perType : Person.Type = Person.self
    var stuType : Student.Type = Student.self
    perType = Student.self
    //stuType = Person.self
    
    var anyType : AnyObject.Type = Student.self
    anyType = Person.self
    
    var anyType2 : AnyClass = Student.self
    anyType2 = Person.self
    
    var per = Person()
    var perType2 = type(of: per) //Person.Type
    print(Person.self == perType2) //true
    
    class Animal {
        required init() { }
        class func speak() { print("Animal speak") }
    }
    
    class Cat: Animal { }
    class Dog: Animal { }
    class Pig: Animal { }
    func create(_ clses: [Animal.Type]) -> [Animal] {
        var arr = [Animal]()
        for cls in clses {
            cls.speak()
            arr.append(cls.init())
        }
        return arr
    }
    
    print(create([Cat.self,Dog.self,Pig.self]))
}

//MARK: 元类型
func testXType2() {
    class Person {
        static var age = 0
        static func run() {}
    }
    
    Person.age = 10
    Person.self.age = 10
    Person.run()
    Person.self.run()
    
    var p0 = Person()
    var p1 = Person.self()
    var p2 = Person.init()
    var p3 = Person.self.init()
}

//testXType()

//MARK: runtime 在 swift中的实现
func testRunTime() {
    class Person {
        var age: Int = 0
    }
    
    class Student : Person {
        var no: Int = 0
    }
    
    print(class_getInstanceSize(Student.self)) //32
    print(class_getSuperclass(Student.self)!) //Person
    print(class_getSuperclass(Person.self)!) //_TtCs12_SwiftObject
}
//testRunTime()

protocol SelfProtocol {
    func test() -> Self
}

//MARK: Self
func testSelf() {
//    class Person {
//        var age = 1
//        static var count = 2
//        func run() {
//            print(self.age)
//            print(Self.count)
//        }
//    }
    
    class Person : SelfProtocol {
        required init() {}
        func test() -> Self {
            type(of: self).init()
        }
        func speak() {
            print("Speak")
        }
    }
    
    class Student: Person {
        @discardableResult func sayHello() -> Self {
            let instance = type(of: self).init()
            instance.speak()
            return instance
        }
    }
    
    var stu = Student()
    stu.sayHello()
}

//testSelf()


