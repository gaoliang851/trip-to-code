//
//  main.swift
//  Swift之继承
//
//  Created by mac on 2020/9/4.
//  Copyright © 2020 Dever.G. All rights reserved.
//

import Foundation

//MARK: 重写实例方法、下标
func overrideInstance() {
    class Animal {
        func speak() {
            print("Aniaml speak")
        }
        subscript(index: Int) -> Int {
            return index
        }
    }
    
    var anim : Animal
    anim = Animal()
    anim.speak()
    print(anim[6])//6
    
    class Cat : Animal {
        override func speak() {
            super.speak()
            print("Cat speak")
        }
        override subscript(index: Int) -> Int {
            return super[index] + 1
        }
    }
    anim = Cat()
    anim.speak()
    print(anim[6])//7
}
//overrideInstance()

//MARK: 重写类型方法、下标
func overrideStatic() {
    class Animal {
        class func speak() {
            print("Animal speak")
        }
    }
    class Cat : Animal {
        override static func speak() {
            super.speak()
            print("Cat speak")
        }
    }
}
//MARK: 重写实例属性
func overrideInstanceProperties() {
    class Circle {
        var radius: Int = 0
        var diameter : Int {
            set {
                print("Circle setDiameter")
                radius = newValue / 2;
            }
            get {
                print("Circle getDiameter")
                return radius * 2
            }
        }
    }
    class SubCircle: Circle {
        override var radius: Int {
            set {
                print("SubCircle setRadius")
                super.radius = newValue > 0 ? newValue : 0
            }
            get {
                print("SubCircle getRadius")
                return super.radius
            }
        }
        override var diameter: Int {
            set {
                print("SubCircle setDiameter")
                super.diameter = newValue > 0 ? newValue : 0
            }
            get {
                print("SubCircle getDiameter")
                return super.diameter
            }
        }
    }
    
    let circle = SubCircle()
    //SubCircle setRadius
    circle.radius = 6
    
    //SubCircle getDiameter
    //Circle getDiameter
    //SubCircle getRadius
    print(circle.diameter)
    
    //SubCircle setDiameter
    //Circle setDiameter
    //SubCircle setRadius
    circle.diameter = 20
    
    //SubCircle getRadius
    //10
    print(circle.radius)
}
//overrideInstanceProperties()
func overrideStaticProperty() {
    class Circle {
        static var radius: Int = 0
        class var diameter: Int {
            set {
                print("Circle setDiameter")
                radius = newValue / 2
            }
            get {
                print("Circle getDiameter")
                return radius * 2
            }
        }
    }
    
    class SubCircle : Circle {
        override static var diameter: Int {
            set {
                print("SubCircle setDiameter")
                radius = newValue > 0 ? newValue : 0
            }
            get {
                print("SubCircle getDiameter")
                return super.diameter
            }
        }
    }
    
}

//MARK: 子类为父类存储属性增加属性观察器
func storedProperties() {
    class Circle {
        var radius: Int = 0
    }
    class SubCircle: Circle {
        override var radius: Int {
            willSet {
                print("SubCircle willSetRadius",newValue)
            }
            didSet {
                print("SubCircle didSetRadius",oldValue)
            }
        }
    }
    let circle = SubCircle()
    //SubCircle willSetRadius 10
    //SubCircle didSetRadius 0
    circle.radius = 10
}

//storedProperties()

//MARK: 子类重写父类属性观察器
func overridePropertyObserver() {
    class Circle {
        var radius: Int = 1 {
            willSet {
                print("Circle willSetRadius ",newValue)
            }
            didSet {
                print("Circle didSetRadius ",oldValue)
            }
        }
    }
    class SubCircle: Circle {
        override var radius: Int {
            willSet {
               print("SubCircle willSetRadius ",newValue)
            }
            didSet {
                print("SubCircle didSetRadius ",oldValue)
            }
        }
    }
    let circle = SubCircle()
    //SubCircle willSetRadius  10
    //Circle willSetRadius  10
    //Circle didSetRadius  1
    //SubCircle didSetRadius  1
    circle.radius = 10
}

//overridePropertyObserver()
//MARK: 子类给父类的计算属性添加属性观察器
func countPropertyAddPropertyObserver() {
    class Circle {
        var radius: Int {
            set {
                print("Circle set Radius",newValue)
            }
            get {
                print("Circle getRadius")
                return 20
            }
        }
    }
    class SubCircle : Circle {
        override var radius: Int {
            willSet {
                print("SubCircle willSetRadius ",newValue)
            }
            didSet {
                print("SubCircle didSetRadius",oldValue,radius)
            }
        }
    }
    
    let circle = SubCircle()
    //Circle getRadius
    //SubCircle willSetRadius  10
    //Circle set Radius 10
    //Circle getRadius
    //SubCircle didSetRadius 20 20
    circle.radius = 10
}

//countPropertyAddPropertyObserver()
//MARK: 多态
func muiltState() {
    class Animal {
        func speak() {
            print("Animal speak")
        }
        func eat() {
            print("Animal eat")
        }
        func sleep() {
            print("Animal sleep")
        }
    }
    
    class Dog: Animal {
        override func speak() {
            print("Dog speak")
        }
        
        override func eat() {
            print("Dog eat")
        }
        
        func run() {
            print("Dog run")
        }
    }
}
