//
//  main.swift
//  Swift之可选链
//
//  Created by mac on 2020/9/7.
//  Copyright © 2020 Dever.G. All rights reserved.
//

import Foundation

func testOptionalChaining1() {
    class Car { var price = 0 }
    class Dog { var weight = 0 }
    class Person {
        var name: String = ""
        var dog: Dog = Dog()
        var car: Car? = Car()
        func age() -> Int { 18 }
        func eat()  { print("Person eat") }
        subscript(index: Int) -> Int { index }
    }

    let person: Person? = Person()
    var age1 = person?.age() //age1的类型是Int?,如果person是nil,age1是nil
    var age2 = person!.age() //age2的类型是Int,如果person是nil,使用"!"强制解包会崩溃
    var name = person?.name //name的类型是 String?
    var index = person?[6] //index的类型是 Int？
    
    //判断一个可选项调用方法是否成功，可使用可选项绑定来判断。即通过函数返回值来判断，对于没有返回值的方法，也可使用返回值(空元组)，因为在swift中，无返回值就是返回 Void类型,Void类型就是空元祖类型 ()
    if let _ = person?.eat() {
        print("eat 调用成功")
    } else {
        print("eat 调用失败")
    }
    if let person_temp = person {
        person_temp.eat()
    } else {
        print("person:nil")
    }
    
    var dog = person?.dog //dog类型是Dog?
    var weight = person?.dog.weight //weight的类型Int?
    var price = person?.car?.price //price的类型是Int?
}

//testOptionalChaining1()

func testOptionalChaining2() {
    //scores的类型是 [String,[Int]]
    var scores = [
        "Jack":[86,82,64],
        "Rose":[79,94,81],
    ]
    
    scores["Jack"]?[0] = 11
    scores["Rose"]?[2] += 10
    scores["Kate"]?[0] = 88
    print(scores)
  
    //
    var num1: Int? = nil
    num1 = 10
    print(num1)
    
    var dict: [String : (Int,Int) -> Int] = [
        "sum": (+),
        "difference" : (-)
    ]
    var result = dict["sum"]?(10,20)
    print(result)//Optional(30)

}

testOptionalChaining2()

