//
//  ViewController.swift
//  iOS从OC迁移到Swift
//
//  Created by mac on 2020/12/6.
//

import UIKit

//func sum(_ a: Int32,_ b: Int32) -> Int32 {
//    return (a + b) * 2
//}
//
//@_silgen_name("sum") func oc_sum(_ a: Int32,_ b: Int32) -> Int32

class ViewController: UIViewController {
    
    static let initTask1: Void = {
        print("initTask1-------")
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let _ = Self.initTask1
        
        let _ = Self.initTask1
        // Do any additional setup after loading the view.
        
//        let p = OCPerson(age: 10, name: "Jack")
//        p.age = 19
//        p.name = "Rose"
//        p.run()//19 Rose -run
//        p.eat("Apple", other: "Water")//19 Rose -eat Apple Water
//
//        OCPerson.run() //OCPerson + run
//        OCPerson.eat("Pizza", other: "Banana")//OCPerson +eat Pizza Banana
//
//
//        print(sum(32, 34)) //132
//        print(oc_sum(32, 34))//66
//
        
        //可以直接使用 .async + 尾随闭包的方式
//        DispatchQueue.global().async {
//            print("1",Thread.current)
//            DispatchQueue.main.async {
//                print("2",Thread.current)
//            }
//        }
        //也可以将尾随闭包封装成DispatchWorkItem
//        let todoItem = DispatchWorkItem {
//            print("3",Thread.current)
//        }
        //异步执行todoItem
//        DispatchQueue.global().async(execute: todoItem)
        //todoItem执行完成后，再次回调主线程执行操作
//        todoItem.notify(queue: DispatchQueue.main) {
//            print("4",Thread.current)
//        }
        
        //2.0秒后执行
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0,execute: todoItem)

    }


}

