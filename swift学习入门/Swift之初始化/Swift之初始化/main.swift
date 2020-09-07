//
//  main.swift
//  Swift之初始化
//
//  Created by mac on 2020/9/6.
//  Copyright © 2020 Dever.G. All rights reserved.
//

import Foundation

//MARK: 初始化器
func initializer() {
    class Person {
        var age = 0
        var name = ""
        init(age: Int,name: String) {
            self.age = age
            self.name = name
        }
        convenience init(age: Int) {
            self.init(age: age, name: "")
            self.age = age
        }
        convenience init(name: String) {
            self.init(age: 0,name: name)
            self.name = name
        }
    }
    
    class Student: Person {
        var score: Int
        init(age: Int,name: String , score: Int) {
            self.score = score;//在调用父类指定初始化器前使用self。
            super.init(age: age,name: name)
        }
        
        convenience init(score: Int) {
            self.init(age: 0,name: "", score:score)
        }
    }
    
}

//initializer()

//MARK: required
func requiredInitializer() {
    class Person {
        required init() {}
        init(age: Int) { }
    }
    class Student: Person {
        init(no: Int) {
            super.init(age: 0)
        }
        required init() {
            super.init()
        }
    }
}

//requiredInitializer()
//MARK: 属性观察器
func propertiesObserver() {
    class Person {
        var age: Int {
            willSet {
                print("willSet:",newValue)
            }
            didSet {
                print("didSet:",oldValue,":",age)
            }
        }
        init() {
            self.age = 0
        }
    }
    class Student : Person {
        override init() {
            super.init()
            self.age = 1
        }
    }
    
    //willSet: 1
    //didSet: 0 : 1
    var _ = Student()
}
//propertiesObserver()

//MARK: 可失败初始化器
func testInit() {
    class Person {
        var name: String
        init?(name: String) {
            if name.isEmpty {
                return nil
            }
            self.name = name
        }
    }
    
    var p = Person(name: "") // p的类型是 Person?
    print(p)
    var p2 = Person(name: "abc")
    print(p2)
    var num = Int("123") // public init?(_ description: String)
    enum Answer: Int {
        case wrong, right
    }
    var an = Answer(rawValue: 1)// an的类型是 Answer?
}
//testInit()

func testInit2() {
    class Person {
        var name: String
        var age : Int = 0
        init?(name: String) {
            if name.isEmpty {
                return nil
            }
            self.name = name
        }
        convenience init(age: Int,name: String) {
            self.init(name: name)!//调用可失败初始化器需要强制解包，假如 init!(name: String),就不需要强制解包了
            print("exec")
            self.age = age
        }
    }
    var _ = Person(age: 12, name: "")//直接崩溃在self.init(name:name)!
    var _ = Person(age: 12, name: "agb") //可以正常执行
    
    class Student: Person {
        override init(name: String) {
            var default_name = "default"
            if name.isEmpty {
                default_name = name
            }
            super.init(name: default_name)!
        }
    }
    
}
//testInit2()

//MARK: 反初始化器
func testdeinit() {
    class Person {
        deinit {
            print("person deinit")
        }
    }
    class Student : Person {
        deinit {
            print("student deinit")
        }
    }
    
    /**
     控制台输出：
     -----
     student deinit
     person deinit
     ......
     */
    print("-----")
    var _ = Student()
    print("......")
}
testdeinit()
