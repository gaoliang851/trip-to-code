//
//  main.swift
//  Swift之内存管理
//
//  Created by mac on 2020/10/22.
//

import Foundation

//AnyObject代表只能用类实现该实例
//protocol Liveable: AnyObject { }
//class Person {
//    func run() { }
//}
//
//weak var p0: Person?
//weak var p1: AnyObject?
//weak var p2: Liveable?
//
//unowned var p10: Person?
//unowned let p11: Person
//unowned var p12: AnyObject
//unowned var p13: Liveable
//
//autoreleasepool {
//    let p = Person()
//    p.run()
//}

//MARK: 闭包循环引用
class Person {
    var fn: (() -> ())?
    func run() { print("run") }
    deinit { print("deinit") }
}
func test() {
    let p = Person()
    p.fn = {
        //第一种写法
//        [weak p] in
//        p?.run()
        //第二种写法，定义新的变量名
        //[weak weakP = p] in
        //weakP?.run()
        [unowned p] in
        p.run()
    }
}
//test()

class Student {
    lazy var fn: (() -> ()) = {
        [weak self] in
        self?.run()
    }
    func run() { print("run") }
    deinit { print("Student run") }
}

class Wirtor {
    var age = 0
    lazy var getAge: Int = {
        self.age
    }()
    deinit { print("wirtor deinit") }
}

func wirtorTest() {
    let w = Wirtor()
    print(w.getAge)
}

//wirtorTest()

typealias Fn = () -> ()

//fn是非逃逸闭包
func test1(_ fn: Fn) { fn() }

//fn是逃逸闭包
var gFn: Fn?
func test2(_ fn: @escaping Fn) {
    gFn = fn
}

//fn是逃逸闭包
func test3(_ fn: @escaping Fn) {
    DispatchQueue.global().async {
        fn()
    }
}

class Animal {
    fileprivate var fn: Fn
    //fn是一个逃逸闭包
    init(fn: @escaping Fn) {
        self.fn = fn;
    }
    public func run() {
        //DispatchQueue.global().async 也是一个逃逸闭包
        //它用到了实例成员(属性，方法)，编译器会要强制写明self
        //写明self的作用
        //1：逃逸闭包会对实例产生强引用，不至于等到逃逸闭包执行时，实例被销毁了
        //2：提醒开发者在逃逸闭包访问实例时，是不是要使用weak
        DispatchQueue.global().async {
            self.fn() //
        }
    }
}

//MARK: 内存访问冲突
func plus(_ num: inout Int) -> Int { num + 1 }
var number = 1
print("plus = \(plus(&number))")
print("number = \(number)")

var step = 1
func increment(_ num: inout Int) {
    //如果传入的参数就是step,
    //那么这里对step即进行了读取，也进行了写入的操作
    num = num + step
}
//存在访问冲突
//Simultaneous accesses to 0x10000c8c8,but modification requires exclusive access
//increment(&step)

func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x =  sum / 2
    y = sum - x
}
var num1 = 42
var num2 = 30
balance(&num1, &num2) //OK
//balance(&num1, &num1) //Error
struct Player {
    var name: String
    var health: Int
    var energy: Int
    mutating func shareHealth(with teammate: inout Player) {
        balance(&teammate.health, &health)
    }
}
var oscar = Player(name: "Oscar", health: 10, energy: 10)
var maris = Player(name: "Maria", health: 5, energy: 10)
oscar.shareHealth(with: &maris) //ok
//oscar.shareHealth(with: &oscar) //Error
var tulpe = (health: 10,energy: 20)
//balance(&tulpe.health, &tulpe.energy) //Error:Thread 1: Simultaneous accesses to 0x10000c928, but modification requires exclusive access

// ok
func accessCoTest() {
    var tulpe = (health: 10,energy: 20)
    balance(&tulpe.health, &tulpe.energy)
    
    var holly = (name: "Hello",health: 10, energy: 20)
    balance(&holly.health, &holly.energy)
}
accessCoTest()

//MARK: - 内存
var age = 10
func merroyTest1(_ ptr: UnsafePointer<Int>) {
    //通过pointee属性获取该内存的值
    print(ptr.pointee) //10
}
//merroyTest1(&age)

func merroyTest2(_ ptr: UnsafeMutablePointer<Int>) {
    ptr.pointee += 10 //UnsafeMutablePointer.pointee,可读写
    print(ptr.pointee) //20
}
//merroyTest2(&age)
//print(age)

func merroyTest3(_ ptr: UnsafeRawPointer) {
    print(ptr.load(as: Int.self))
}
//merroyTest3(&age)//10

func merroyTest4(_ ptr: UnsafeMutableRawPointer) {
    ptr.storeBytes(of: 20, as: Int.self)
}
//merroyTest4(&age)
//print(age) //20
var arr = NSArray(objects: 11,22,33,44)
//arr.enumerateObjects { (obj, idx, stop) in
//    print(idx,obj)
//    if idx == 2 {
//        stop.pointee = true
//    }
//}

for (idx,obj) in arr.enumerated() {
    if idx == 1 {
        break
    }
    print(idx,obj)
}

//MARK: 获得指向某个变量的指针
var ptr = withUnsafePointer(to: &age) { (agePtr) -> UnsafePointer<Int> in
    return agePtr
}
//ptr的类型就是UnsafePointer<Int>
print(ptr) //0x000000010000c9b0
print(ptr.pointee) //10

var agePtr = withUnsafePointer(to: &age) { $0 }
print(agePtr) //0x000000010000c9b0
print(agePtr.pointee) //10

var aNumber = 20
var ptr4 = withUnsafeMutablePointer(to: &aNumber) {
    //UnsafeMutableRawPointer的构造函数
    UnsafeMutableRawPointer($0)
}
print("ptr4:",ptr4.load(as: Int.self)) //ptr4: 20
ptr4.storeBytes(of: 2, as: Int.self)

var ptr3 = withUnsafePointer(to: &aNumber) {
    //UnsafeRawPointer的构造函数
    UnsafeRawPointer($0)
}
print("ptr3:",ptr3.load(as: Int.self))//ptr3: 2





//UnsafeRawPointer(0x1111)

//MARK: 获取堆空间的地址值
class Person4 {
    var age = 10
    var sclo = 20
}
var p = Person4()
var pptr = withUnsafePointer(to: &p) { UnsafeRawPointer($0) }
//pptr 是 变量p的地址值
print(pptr) //0x0000000100010b60
print(pptr.load(as: Person4.self)) //Person4

var heapPtr = UnsafeRawPointer(bitPattern: pptr.load(as: UInt.self))
print(heapPtr!) //0x0000000102155a80 堆空间地址值

var p4ptr = unsafeBitCast(p, to: UnsafeRawPointer.self)
print("",p4ptr) //0x000000010055d480

//print(heapPtr?.load(as: Person4.self) as Any) //Optional(Person4)

//print("Int.self size:",MemoryLayout.size(ofValue: p))

//MARK: - 创建指针

//创建，
//向堆空间申请16个字节的内存，
//返回 UnsafeMutableRawPointer? 类型的变量（可读写）
var myPtr = malloc(16)

//存
//默认从第一个字节开始存储，以Int型（8个字节），存入数据 11
myPtr?.storeBytes(of: 11, as: Int.self)
//但是 myPtr 有16个自己，前面占用了8个，
//如果想操作后面的内存可以使用偏移量
//偏移8个字节，再以Int型（8个字节）存入数据22
myPtr?.storeBytes(of: 22, toByteOffset: 8, as: Int.self)

//取
//以Int型（读取前8个字节）,获取指针中的数据,默认从第一个字节开始读取
print((myPtr?.load(as: Int.self))!) //11
//如果想从具体的某个字节数开始读，开始通过设置偏移量来完成
//偏移8个字节,再以Int(读取8个字节)型读取数据
print((myPtr?.load(fromByteOffset: 8, as: Int.self))!) //22



//最后不要忘记销毁指针
free(myPtr)


//申请一个16字节内存空间,对齐方式一般填1
var myPtr2 = UnsafeMutableRawPointer.allocate(byteCount: 8, alignment: 1)

//向前八个字节存入Int型整数:8
myPtr2.storeBytes(of: 8, as: Int.self)

//偏移字节除了可以用  UnsafeMutableRawPointer.storeBytes(of: T, toByteOffset: Int, as: T.Type)，也可以用advanced方法
//获取 myPtr2偏移8个字节后的内存指针,存入数据
var offset8Mem = myPtr2.advanced(by: 8)
offset8Mem.storeBytes(of: 30, as: Int.self)

print(myPtr2.load(as: Int.self)) // 8
print(myPtr2.advanced(by: 8).load(as: Int.self)) //30

//销毁,除了可以使用free函数，也可以使用 UnsafeMutableRawPointer.deallocat()
myPtr2.deallocate()

//申请3个Int型内存空间,一个Int型占8个字节,说白了就是24个字节
var myPtr3 = UnsafeMutablePointer<Int>.allocate(capacity: 3)

//myPtr3.initialize(to: 1) //第一个Int内存（前八个字节）初始化为1
//myPtr3.successor().initialize(to: 20) // 第二个Int(中间八个字节)内存地址初始化为20
//myPtr3.successor().successor().initialize(to: 33) //第三个Int内存（最后八个字节）初始化为33

myPtr3.pointee = 5 //第一个Int内存（前八个字节）初始化为5
(myPtr3 + 1).pointee = 21 //第二个Int(中间八个字节)内存地址初始化为21
(myPtr3 + 2).pointee = 25 //第三个Int内存（最后八个字节）初始化为25

print(myPtr3.pointee) //5
print((myPtr3 + 1).pointee) //21
print((myPtr3 + 2).pointee) //25

myPtr3.deinitialize(count: 3)
myPtr3.deallocate()

//MARK: 指针之间的转换

var rawPtr = UnsafeMutableRawPointer.allocate(byteCount: 16, alignment: 1)

// assumingMemoryBound: 假设内存绑定
// rawPtr指针假设为 Int型来读取 (获取前八个字节),返回一个 Int泛型的UnsafeMutablePointer
//top8Ptr的类型是 UnsafeMutablePointer<Int>
var top8Ptr = rawPtr.assumingMemoryBound(to: Int.self)
top8Ptr.pointee = 1

//将rawPtr偏移8个字节后，获取到后8个字节
//将后8个字节内存假设为Double行,写入 2.0
(rawPtr + 8).assumingMemoryBound(to: Double.self).pointee = 2.0

var ptr1 : UnsafePointer<Int> = unsafeBitCast(rawPtr, to: UnsafePointer.self)
print(ptr1.pointee) // 1

var ptr2 : UnsafePointer<Double> = unsafeBitCast(rawPtr + 8, to: UnsafePointer.self)
print(ptr2.pointee) // 2.0

var pointerPtr = UnsafeMutablePointer<Int>.allocate(capacity: 1)

var rawptr = unsafeBitCast(pointerPtr, to: UnsafeMutableRawPointer.self)
rawptr.storeBytes(of: 2.0, as: Double.self)

print(pointerPtr.pointee) //4611686018427387904

var otherRawPointer = UnsafeRawPointer(pointerPtr)
print(otherRawPointer.load(as: Double.self)) // 2.0

var otherMutableRawPointer = UnsafeMutableRawPointer(pointerPtr)
otherMutableRawPointer.storeBytes(of: 4, as: Int.self)
print(pointerPtr.pointee) // 4
