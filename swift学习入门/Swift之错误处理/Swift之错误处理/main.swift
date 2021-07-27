//
//  main.swift
//  Swift之错误处理
//
//  Created by mac on 2020/9/15.
//  Copyright © 2020 Dever.G. All rights reserved.
//

import Foundation

//MARK: 自定义错误
enum SomeError : Error {
    case illegalArg(String)
    case outOfBounds(Int,Int)
    case outOfMemory
}

struct MyError: Error {
    var msg : String
}

class DIYError: Error {
    var msg: String
    init(msg: String) {
        self.msg = msg
    }
}

func divide(_ num1: Int, _ num2: Int) throws -> Int {
    if num2 == 0 {
        throw SomeError.illegalArg("0不能作为除数")
    }
    
    if num2 < 0 {
        throw DIYError(msg: "除数不能为负数")
    }
    
    return num1 / num2
}

var result = try divide(2, 10)

//MARK: do-catch
func test() {
    print("1")
    do {
        print("2")
        print(try divide(20, 0))
        print("3")
    } catch let SomeError.illegalArg(msg) {
        print("参数异常：",msg)
    } catch let SomeError.outOfBounds(size, index) {
        print("下标越界：","size=\(size),index=\(index)")
    } catch SomeError.outOfMemory {
        print("内存溢出")
    } catch {
        print("其他错误")
    }
    print("4")
}

//test()
//1
//2
//参数异常： 0不能作为除数
//4

func test2() {
    do {
        let result = try divide(20, 0)
        print(result)
    } catch let error {
        switch error {
        case let SomeError.illegalArg(msg):
            print("参数错误：",msg)
        default:
            print("其他错误")
        }
    }
}

//test2()

//MARK: 处理Error
func testHandleError() throws {
    print(1)
    print(try divide(10,0))
    print(2)
}

//try testHandleError()
//1
//Fatal error: Error raised at top level:

func testHandleErroris() throws {
    do {
        print(try divide(20, -2))
    } catch is SomeError {
        print("SomeError")
    }
}

//try testHandleErroris()

func testHandleErrorAs() throws {
    print(1)
    do {
        print(2)
        print(try divide(20, -1))
        print(3)
    } catch let error as SomeError {
        print(error)
    }
    print(4)
}

//try testHandleErrorAs()
//1
//2
//illegalArg("0不能作为除数")
//4

//MARK: try? & try!
func testTry() {
    var result1 = try? divide(20, 10) //Optional(2), Int?
    var result2 = try? divide(20, 0) // nil，并不会崩溃
    
    var result3 = try! divide(20, 10) //2, Int
//    var result4 = try! divide(20, 0) // 崩溃，Error抛出,Fatal error: 'try!' expression unexpectedly raised an error
    
    var a = try? divide(20, 0)
    var b : Int?
    do {
        b = try divide(20, 0)
    } catch  {
        b = nil
        print(error) //illegalArg("0不能作为除数")
    }
}

//testTry()

//MARK: rethrows

func exec(_ fn: (Int,Int) throws -> Int,_ num1: Int ,_ num2: Int) rethrows {
    print(try fn(num1,num2))
}

//try exec(divide(_:_:), 10, 20)

//MARK: defer
//模拟打开文件
func open(_ fileName: String) -> Int {
    print("open")
    return 0
}
//模拟关闭文件
func close(_ file: Int) {
    print("close")
}
func processFile(_ fileName: String) throws {
    let file = open(fileName)
    
    //定义延迟执行的代码
    defer {
        close(file)
    }
    
    let result = try divide(20, 0)
    print(result)
}
//try processFile("test.txt")
//open
//close
//Fatal error: Error raised at top level

func testDefer() throws {
    defer {
        print("first")
    }
    
    defer {
        print("second")
    }
    
    print("abc")
    
    throw SomeError.illegalArg("abc")
}

//try testDefer()
//abc
//second
//first
//Fatal error: Error raised at top level

//MARK: 断言
func assertDevide(_ v1: Int, _ v2: Int) -> Int {
    assert(v2 != 0,"除数不能为0") //是否满足条件，否则抛出错误信息
    return v1 / v2
}
print(assertDevide(10, 2))

//MARK: fatalError
func testFatalError(_ num: Int) -> Int {
    if num >= 0 {
        return 1
    }
    fatalError("num不能小于0")
}
//testFatalError(1)
func testFatalErrorInner() {
    class Person { required init(){} }
    class Student : Person {
        required init() { fatalError("don't call Student.init")}
        init(_ score: Float) {}
    }
    //var a = Student()
    var b = Student(20)
}
//testFatalErrorInner()

//MARK: 局部作用域
func testDo() {
    do {
        var a = 4
        let b = 5
        print(a + b)
    }
    do {
        var a = 4
        let b = 5
        print(a - b)
    }
}
testDo()
