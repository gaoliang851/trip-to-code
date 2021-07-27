//
//  main.swift
//  swift之从OC迁移
//
//  Created by mac on 2020/12/6.
//

import Foundation

//func log<T>(_ msg: T,
//            file: NSString = #file,
//            line: Int = #line,
//            fn: String = #function) {
//    let prefix = "\(file.lastPathComponent)_\(line)_\(fn):"
//    print(prefix,msg)
//}
//
////操作系统可选值：macOS\iOS\tvOS\watchOS\Linux\Android\Windows\FreeBSD
//#if os(macOS) || os(iOS)
////CPU架构： i386\x86_64\arm\arm64
//#elseif arch(i386) || arch(arm)
////swift版本
//#elseif swift(<5) && swift(>=3)
////模拟器
//#elseif targetEnvironment(simulator)
////可以导入某模块
//#elseif canImport(Foundation)
//#else
//#endif
//
//#if TEST
//log("TEST") //TEST
//#else
//log("Release")
//#endif
//
//#if OTHER
//log("other")
//#endif
//
//#if AAA
//log("AAA")
//#endif
//
//if #available(iOS 10,macOS 10.12, *) {
//    //对于iOS平台，只在iOS10及以上版本执行
//    //对于macOS平台，只在macOS 10.12及以上版本执行
//    //最后的*, 表示在其他所有平台都执行
//}
//
//@available(iOS 10, macOS 10.25, *)
//class Person { }
//
//struct Student {
//    @available(*, unavailable, renamed: "study")
//    func learn() {}
//    func study() {}
//
//    @available(iOS, deprecated: 11)
//    @available(macOS, deprecated: 10.12)
//    func run() {}
//}
//
//var s = Student()
////s.run() //warn:'run()' was deprecated in macOS 10.12
////s.learn() //error:'learn()' has been renamed to 'study'
//
////var p = Person() //error:'Person' is only available in macOS 10.25 or newer
//
////MARK: 字符串
////空字符串
////var emptyStr1 = ""
////var emptyStr2 = String()
////
////var str1:String = "1"
//////拼接字符串
////str1.append("_2")
////print(str1)//1_2
//////重载运算符 +
////str1 = str1 + "_3"
////print(str1)//1_2_3
////str1 += "_4"
////print(str1) //1_2_3_4
//////插值
////str1 = "\(str1)_5"
////print(str1) //1_2_3_4_5
//////长度
////print(str1.count) //9
////
////
////
//////判断前缀和后缀
////print(str1.hasPrefix("1_2")) //true
////print(str1.hasSuffix("4_5")) //true
////
////
////var str = "1_2"
////str.insert("_", at: str.endIndex)
////print(str)//1_2_,str.endIndex代表字符串最后的位置
////str.insert(contentsOf: "3_4", at: str.startIndex)
////print(str)//3_41_2_
////
//////
////
////var testStr = "Hello world"
////print(testStr[testStr.startIndex]) //H
////var beforeEndIndex = testStr.index(before: testStr.endIndex)
////print(testStr[beforeEndIndex])//d,testStr[testStr.endIndex]会崩溃
////
//////获取第二个字符的索引
////var secondCharIndex = testStr.index(after: testStr.startIndex)
////print(testStr[secondCharIndex])//e
//////获取第五个字符的索引，startIndex向后偏移4个单位
////var foursCharIndex = testStr.index(testStr.startIndex, offsetBy: 4)
////print(testStr[foursCharIndex])//o
////
//////获取最后一个字符
////var lastCharIndex = testStr.index(before: testStr.endIndex)
////print(testStr[lastCharIndex])//d
////
////for index in testStr.indices {
////    print("\(testStr[index])")
////}//H e l l o  w o r ld
//
////------插入
//
//var str = "1_2"
////向索引位置插入一个字符,1_2_
//str.insert("_", at: str.endIndex)
////向索引位置插入另外一个字符串，1_2_3_4
//str.insert(contentsOf: "3_4", at: str.endIndex)
////向第一个字符后插入另外一个字符串,1666_2_3_4
//str.insert(contentsOf: "666", at: str.index(after: str.startIndex))
////向最后一个字符前面一个位置,1666_2_3_8884
//str.insert(contentsOf: "888", at: str.index(before: str.endIndex))
//
////-------删除
//
////fisrtCharOneIndex 是String.Index?类型，
//var fisrtCharOneIndex = str.firstIndex(of: "1")
//if let firstrIndex = fisrtCharOneIndex {
//    str.remove(at: firstrIndex)//666_2_3_8884
//}
//
////removeAll后边是一个尾随闭包，这个方法会遍历字符串中的每个char，闭包中返回Bool来表示是否要删除这个char
////也可以简写为：
////str.removeAll { $0 == "6"}
//str.removeAll { (char) -> Bool in
//    char == "6"
//}
////str: _2_3_8884
//
//var range = str.index(str.endIndex, offsetBy: -4)..<str.index(before: str.endIndex)
//str.removeSubrange(range)//2_3_4
//print(str)
//
////MARK: SubString
//var aString = "1_2_3_4_5"
////1_2
//var substr1 = aString.prefix(3)
////4_5
//var substr2 = aString.suffix(3)
//var subRange = str.startIndex..<str.index(str.startIndex, offsetBy: 3)
////1_2
//var substr3 = aString[subRange]
////最初的String,1_2_3_4_5
//print(substr3.base)
////Substring -> String, 1_2
//var subString = String(substr3)
//
////MARK: Character
//for c in "Hello world" { //c是Character类型
//    print(c)
//}
//var theString = "java"
////c是Character类型
//var c = theString[theString.startIndex]
//
////MARK: 多行String
//let mutilString = """
//Escaping the first quote \"""
//Escaping two quotes \"\""
//Escaping all three quotes \"\"\"
//"""
//print(mutilString)
//MARK: String与NSString
//var str1: String = "jack"
//var str2: NSString = "rose"
//
//var str3 = str1 as NSString
//var str4 = str2 as String
//
//var str5 = str3.substring(with: NSRange(location: 0, length: 2))
//print(str5)//ja

//MARK:
protocol Runnable1: AnyObject { }
protocol Runnable2: class { }
@objc protocol Runnable3 { }

//@objc protocol Runnable {
//    func run()
//    @objc optional func run2() //run2为可选方法
//    func run3()
//}
//
//class Dog: Runnable {
//    func run() { }
//    func run3() { }
//}

//protocol Runnable {
//    func run1()
//    func run2()
//    func run3()
//}
//extension Runnable {
//    func run1() { }
//}
//
//class Dog: Runnable {
//    func run2() {}
//    func run3() {}
//}

//不论类是否继承自NSObject,使用@objc dynamic修饰方法都会调用objc_msgSend
//class Dog {
//    @objc dynamic func test1() { }
//    func test2() { }
//}
//
//var d = Dog()
//d.test1() //底层会走objc_msgSend()
//d.test2() //底层会走Swift虚表调用方法

//class Person: NSObject {
//    @objc dynamic var age = 0
//    override init() {
//        super.init()
//        self.addObserver(self, forKeyPath: "age", options: .new, context: nil)
//    }
//    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        print(keyPath!,change![.newKey]!)
//    }
//    deinit {
//        self.removeObserver(self, forKeyPath: "age")
//    }
//}
//var p = Person()
//p.age = 10//age 10
//p.setValue(25, forKey: "age")//age 25

class Person: NSObject {
    @objc dynamic var age: Int = 0
    var observation: NSKeyValueObservation?
    override init() {
        super.init()
        //keyPath这里要用 "\" + keyPath 的方式
        observation = observe(\Person.age, options: .new, changeHandler: {
            (person, change) in
            print(change.newValue as Any)
        })
    }
}
var p = Person()
p.age = 10//Optional(10)
p.setValue(20, forKey: "age")//Optional(20)

class Student { }
extension Student {
    private static var AGE_KEY: Void?
    var age: Int {
        get {
            (objc_getAssociatedObject(self, &Self.AGE_KEY) as? Int) ?? 0
        }
        set {
            objc_setAssociatedObject(self, &Self.AGE_KEY, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
}
var s = Student()
s.age = 20
print(s.age)//20


