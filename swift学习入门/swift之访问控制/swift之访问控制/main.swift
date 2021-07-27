//
//  main.swift
//  swift之访问控制
//
//  Created by mac on 2020/10/20.
//

import Foundation

//MARK: 访问级别的使用准则
/*
fileprivate class Person {
    var age = 0
}
internal var p = Person() //报错
*/

//MARK: 元组类型
/*
internal struct Dog{}
fileprivate class Person{}

fileprivate var data1: (Dog,Person)
private var data3: (Dog,Person)
internal var data2: (Dog,Person) //报错
*/

//MARK: 泛型类型
/*
internal class Car {}
fileprivate class Dog {}
public class Person<T1,T2> {}

//Person<Car,Dog> 的访问级别是fileprivate
fileprivate var p = Person<Car,Dog>()
*/
//MARK: 成员、嵌套类型
//private class Person {}
//fileprivate class Student : Person {}

/*
private struct Dog {
    private var age: Int = 0
    private func run() { }
}

fileprivate struct Person {
    var dog: Dog = Dog()
    mutating func walk() {
        dog.run()
        dog.age = 1
    }
}*/
class Test {
    private class Dog {
        var age: Int = 0
        func run() { }
    }
    private class Person {
        var dog: Dog = Dog()
        func walk() {
            dog.age = 1
            dog.run()
        }
    }
}

//MARK: getter & setter
//全局变量num get是public级别的，set是fileprivate
/*
fileprivate(set) public var num = 10

class Person {
    private(set) var age = 0 //外部可以访问(internal)，但只能在内部修改
    fileprivate(set) public var weight: Int { //外部可以访问(public)，但只能在文件内修改
        set {}
        get { 10 }
    }
    //下标方法get是public访问级别，set是internal级别的
    internal(set) public subscript(index: Int) -> Int {
        set { }
        get { index }
    }
}
var p = Person()
print(p.age)
p.weight = 20
//p.age = 10
*/
public class Point {
    //默认是 internal级别，如果使用fileprivate或者private修饰，编译不通过
    required init() { }
}

struct Size {
    private var width = 0
    var height = 0
}
//var size = Size(width: 0, height: 0),编译报错
//size = Size(width: 0),编译报错
//size = Size(height: 0),编译报错
var size = Size() //通过

//MARK: enum
enum Season {
//    fileprivate case Spring
    case Summer
}

//MARK: 协议
fileprivate protocol Runnalbe {
    func run()
}

public class Person : Runnalbe {
    func run() { }
}

//MARK: 扩展
public class Student {
    private func learn() { }
    private func go() {
        test2()
    }
}

extension Student {
    private func test() {
        learn()
    }
    private func test2() { }
}
extension Student {
    private func abc() {
        test2()
    }
}

internal extension Student {
    private func run() { }
    fileprivate func walk() {
        run()
    }
}

var stu = Student()
//stu.walk()

extension Student : CustomDebugStringConvertible {
    public var debugDescription: String {
        get {
            "Student"
        }
    }
}


//MARK: 成员的重写
public class Persons {
    public func run() { }
}
public class Students: Persons {
    public override func run() { }
}

class Person2 {
    private func run() {}
    class Student2: Person2 {
        //Person2内部定义的子类可以重写private方法,
        //因为 Student2类 和 Person.run 在同一作用域
        override func run() { }
    }
    fileprivate func walk() { }
}
class Student2: Person2 {
    //因为 Student2类 和 Person.walk 在同一作用域
    override func walk() { }
}

//MARK: - inout参数
typealias Fn = () -> ()
func other1(_ fn: Fn) {
    fn()
}
func other2(_ fn: @escaping Fn) {
    fn()
}
func testInout(value: inout Int) -> Fn {
    other1 {
        value += 1;
    }
    other2 { //Error: Escaping closure captures 'inout' parameter 'value'
        value += 1;
    }
    func plus() {
        value += 1
    }
    return plus //Error: Escaping closure captures 'inout' parameter 'value'
}





