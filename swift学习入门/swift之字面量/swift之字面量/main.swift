//
//  main.swift
//  swift之字面量
//
//  Created by mac on 2020/11/13.
//

//typealias FloatLiteralType = Float

//var age = 1.68 //Float

var arr: Array = [1,2,3]
var set: Set = [1,2,3]

print(arr)
print(set)

extension Int : ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: Bool) {
        self = value ? 1 : 0
    }
}

var age: Int = true
print(age) //1
age = false
print(age) //0

class Student: ExpressibleByFloatLiteral,ExpressibleByIntegerLiteral,ExpressibleByStringLiteral,CustomStringConvertible {
    var name: String = ""
    var score: Double = 0
    required init(floatLiteral value: Double) {
        self.score = value
    }
    required init(integerLiteral value: Int) {
        self.score = Double(value)
    }
    required init(stringLiteral value: String) {
        self.name = value
    }
    
    var description: String {
        "name=\(name),score=\(score)"
    }
}

var stu:Student = 90
print(stu) //name=,score=90.0
stu = 98.5
print(stu) //name=,score=98.5
stu = "Kaka"
print(stu) //name=Kaka,score=0.0

struct Point : CustomStringConvertible {
    var x = 0.0
    var y = 0.0
    var description: String {
        "x=\(x),y=\(y)"
    }
}

extension Point: ExpressibleByArrayLiteral, ExpressibleByDictionaryLiteral {
    init(arrayLiteral elements: Double...) {
        guard elements.count > 0 else { return }
        self.x = elements[0]
        guard elements.count > 1 else { return }
        self.y = elements[1]
    }
    
    init(dictionaryLiteral elements: (String, Double)...) {
        for (k,v) in elements {
            if k == "x" {
                self.x = v
            } else if k == "y" {
                self.y = v
            }
        }
    }
}

var point: Point = [1,2]
print(point) //x=1.0,y=2.0
point = ["x": 11, "y": 22]
print(point) //x=11.0,y=22.0


