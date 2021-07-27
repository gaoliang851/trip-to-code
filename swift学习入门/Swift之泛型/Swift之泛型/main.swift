//
//  main.swift
//  Swift之泛型
//
//  Created by mac on 2020/9/18.
//  Copyright © 2020 Dever.G. All rights reserved.
//

//MARK:函数中使用泛型
func swapValues<T>(_ a: inout T,_ b: inout T) {
    (a,b) = (b,a)
}

var n1 = 5
var n2 = 6
swapValues(&n1, &n2)
print("n1:\(n1),n2:\(n2)") //n1:6,n2:5

var s1 = "abc"
var s2 = "test"
swapValues(&s1, &s2)
print("s1:\(s1),s2:\(s2)") //s1:test,s2:abc

//MARK: 函数中使用多种类型的泛型
func mutilTypeTest() {
    func mutilType<T1,T2>(_ t1: T1, _ t2: T2) -> Int {
        return 0
    }
    var fn: (Int, Double) -> Int = mutilType
    fn(10,0.5)
}

//MARK: 在类、结构体、枚举中使用泛型
func genericsInClassStructOrEnum() {
    class Stack<E> {
        var elements = [E]()
        init(firstElement: E) {
            elements.append(firstElement)
        }
        func push(_ element: E){ elements.append(element) }
        func pop() -> E { elements.removeLast() }
        func top() -> E { elements.last! }
        func size() -> Int { elements.count }
    }
    
    var iniStack = Stack(firstElement: 10)
    
    class SubStack<E>: Stack<E> {}
    
    struct Stacks<E> {
        var elements = [E]()
        mutating func push(_ element: E){ elements.append(element) }
        mutating func pop() -> E { elements.removeLast() }
        func top() -> E { elements.last! }
        func size() -> Int { elements.count }
    }
    var iniStacks = Stacks<Int>()
    
    enum Score<T> {
        case point(T)
        case grade(String)
    }
    let score0 = Score<Int>.point(100)
    let score1 = Score.point(100)
    let score2 = Score.point(99.5)
    //报错无法匹配出泛型的类型，应该使用 Score<Int>.grade("11")
//    let score3 = Score.grade("11")
    let score4 = Score<Int>.grade("abc")
}

//genericsInClassStructOrEnum()

//MARK: 关联类型
protocol Stackable {
    associatedtype Element // 关联类型
    mutating func push(_ element: Element)
    mutating func pop() -> Element
    func top() -> Element
    func size() -> Int
}
func AssociatedType() {
    class StringStack: Stackable {
//        typealias Element = String
        var elements = [String]()
        func push(_ element: String) { elements.append(element) }
        func pop() -> String { elements.removeLast() }
        func top() -> String { elements.last! }
        func size() -> Int { elements.count }
    }
    
    class Stack<E>: Stackable {
        //可以省略
//        typealias Element = E
        var elementes = [E]()
        func push(_ element: E) { elementes.append(element) }
        func pop() -> E { elementes.removeLast() }
        func top() -> E { elementes.last! }
        func size() -> Int { elementes.count }
    }
}

//MARK: 类型约束
protocol Runnable { }
class Person { }
protocol Arrayable {
    associatedtype Element: Equatable
}
func typeLimit() {
    func swapValues<T: Person & Runnable>(_ a: inout T,_ b: inout T) {
        (a,b) = (b,a)
    }
    class Array<E: Equatable> : Arrayable {
        typealias Element = E
    }
    func equal<S1: Arrayable,S2: Arrayable>(_ s1: S1, _ s2:S2) -> Bool
        where S1.Element == S2.Element, S1.Element: Hashable {
            return false
    }
    var s1 = Array<Int>()
    var s2 = Array<String>()
    //equal(s1, s2)
    //Local function 'equal' requires the types 'Array<Int>.Element' (aka 'Int') and 'Array<String>.Element' (aka 'String') be equivalent
}


//MARK: some
protocol Runable {
    associatedtype Speed
    var speed: Speed { get }
}
func someFunction1() {
    class Person: Runable {
        var speed: Double {
            return 0.0
        }
    }
    class Car: Runable {
        var speed: Int {
            return 0
        }
    }
    func get<T: Runable>(_ type: Int) -> T {
        if type == 0 {
            return Person() as! T
        }
        return Car() as! T
    }
    
    var r1: Person = get(0)
    var r2: Car = get(1)
}



func someFunction2() {
    class Person: Runable {
        var speed: Double {
            return 0.0
        }
    }
    class Car: Runable {
        var speed: Int {
            return 0
        }
    }
    func get(_ type: Int) -> some Runable {
        return Car()
    }
}

protocol RunProtocol {
    associatedtype Speed
}
class Dog :RunProtocol {
    typealias Speed = Double
}
class PersonSignle {
    var pet: some RunProtocol {
        Dog()
    }
}

//MARK: 可选项的本质
func optionalenmu() {
    var age: Int? = 10
    var age0: Optional<Int> = Optional<Int>.some(10)
    var age1: Optional = .some(10)
    var age2 = Optional.some(10)
    var age3 = Optional(10)
    age = nil
    age3 = .none
    
    var age4: Int? = nil
    var age5 = Optional<Int>.none //这里必须要指明类型，否则编译器推断不出
    var age6: Optional<Int> = .none

    var age7: Int? = .none
    age7 = 10
    age7 = .some(20)
    age7 = nil
}

func optionalSwitch() -> () {
    var age: Int? = 10
    switch age {
        case let v?:
            print("some:\(v)")
        case nil:
            print("none")
    }
    
    switch age {
    case let .some(v):
        print("some:\(v)")
    case nil:
        print("nil")
    }
}

//optionalSwitch()
//var age = 10
//switch age {
//case let a where a > 20:
//    print(a)
//default: //编译器提示：Default will never be executed
//    print("default")
//}

func optionalMutil () {
    var age_: Int? = 10
    var age: Int?? = age_
    age = nil
    
    var age0 = Optional.some(Optional.some(10))
    age0 = .none
    var age1: Optional<Optional> = .some(.some(10))
    age1 = .none
    
    var age2: Int?? = 10
    var age3: Optional<Optional> = 10
}
