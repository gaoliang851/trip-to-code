//
//  Person.swift
//  Hello Algorithm
//
//  Created by mac on 2021/7/20.
//

import Foundation

class Person: Equatable,CustomStringConvertible {
    var name: String
    var age: Int
    
    init(name: String,age: Int) {
        self.name = name
        self.age = age
    }
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        if lhs.name == rhs.name && lhs.age == rhs.age  {
            return true
        }
        return false
    }
    
    var description: String {
        return "Person(\(name))"
    }
    
    
    
    
}
