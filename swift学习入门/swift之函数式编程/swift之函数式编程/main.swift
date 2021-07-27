//
//  main.swift
//  swift之函数式编程
//
//  Created by mac on 2020/12/9.
//

import Foundation

//MARK: Array的常见操作
var arr = [1,2,3,4]

//[2, 4, 6, 8]
var arr2 = arr.map { (i) -> Int in
    i * 2
}
//[1, 2, 2, 3, 3, 3, 4, 4, 4, 4]
var numArray = arr.flatMap { (i) -> Array<Any> in
    Array.init(repeating: i, count: i)
}

var strings = ["123","test","jack","-30"]
//[Optional(123), nil, nil, Optional(-30)]
var numbers = strings.map { (str) -> Int? in
    Int(str)
}
//[123, -30]
var numbers2 = strings.compactMap { (str) -> Int? in
    Int(str)
}

//[2, 4]
var filterArray = arr.filter { (element) -> Bool in
    element % 2 == 0
}
//10
var addResult = arr.reduce(0) { (lastResult, element) -> Int in
       lastResult + element
}

//1234
var stringJoined = arr.reduce("") { (lastResult, element) -> String in
    lastResult + "\(element)"
}

print(stringJoined)


var lazyResult = arr.lazy.map { (element) -> Int in
    print("maping:\(element)")
    return element * 2
}
print("mapped",lazyResult[0])
print("mapped",lazyResult[1])
print("mapped",lazyResult[2])

//MARK: optional的map和flatMap
var num1: Int? = 10
//num2:Optional(20)
var num2 = (num1 != nil) ? (num1! + 10) : nil
//num1 = nil
//num1不为nil时，会把num1解包传给i
var num3 = num1.map { (i) -> Int in
    i * 2
}

num1.flatMap { (i) -> Int? in
    i
}

print(num3)
