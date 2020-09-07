//
//  main.swift
//  swift之下标
//
//  Created by mac on 2020/9/3.
//  Copyright © 2020 Dever.G. All rights reserved.
//

import Foundation

//MARK: 定义和使用
func testInit() {
    class Point {
        var x = 0.0, y = 0.0
        subscript(index: Int) -> Double {
            set {
                if index == 0 {
                    x = newValue
                } else if index == 1 {
                    y = newValue
                }
            }
            get {
                if index == 0 {
                    return x
                } else if index == 1 {
                    return y
                }
                return 0.0
            }
        }
    }
    
    let p = Point()
    p[0] = 11.1
    p[1] = 22.2
    print(p.x)
    print(p.y)
    print(p[0])
    print(p[1])
}
//testInit()
//MARK: 没有set方法
func noSetMethod() {
    class Point {
        var x = 10.0, y = 11.0
        subscript(index: Int) -> Double {
            if index == 0 {
                return x
            } else if index == 1 {
                return y
            }
            return 0.0
        }
    }
    let p = Point()
    print(p[1]) //11.0
}
//noSetMethod()
//MARK: 设置参数标签
func setParamTag() {
    class Point {
        var x = 0.0,y = 0.0
        subscript(index i: Int) -> Double {
            if i == 0 {
                return x
            } else if i == 1 {
                return y
            }
            return 0.0
        }
    }
    
    let p = Point()
    p.y = 22.2
    print(p[index: 1])//22.2
}
//setParamTag()
//MARK: 下标可以是类型方法
func testClassSubscript() {
    class Sum {
        static subscript(v1: Int, v2: Int) -> Int {
            v1 + v2
        }
    }
    print(Sum[20,11])//31
}
//testClassSubscript()

//MARK: 结构体、类作为返回值对比
func testReturnValue() {
    class Point {
        var x = 0 ,y = 0
    }
    class PointManager {
        var point = Point()
        subscript(index: Int) -> Point {
            get { point }
//            set { point = newValue }
        }
    }
    
    var pm = PointManager()
    pm[0].x = 11 //Cannot assign to property: subscript is get-only
//    pm[0] = Point(x: 11, y: pm[0].y)
}
//testReturnValue()

//MARK: 接受多个参数下标
func testMuiltParamsSubscript() {
    class Gird {
        var data = [
            [1,2,3],
            [4,5,6],
            [7,8,9]
        ]
        
        subscript(row: Int,column: Int) -> Int {
            set {
                guard row >= 0 && row < 3 && column >= 0 && column < 3 else {
                    return
                }
                data[row][column] = newValue
            }
            get {
                guard row >= 0 && row < 3 && column >= 0 && column < 3 else {
                    return 0
                }
                return data[row][column]
            }
        }
    }
    
    let gird = Gird()
    gird[0,1] = 77
    gird[2,1] = 99
    print(gird.data)
}

testMuiltParamsSubscript()

