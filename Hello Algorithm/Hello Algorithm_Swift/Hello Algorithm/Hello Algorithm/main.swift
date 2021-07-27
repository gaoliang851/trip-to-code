//
//  main.swift
//  Hello Algorithm
//
//  Created by mac on 2021/7/20.
//

import Foundation

func testLinkedList()  {
    let personLinkedList = LinkedList<Person>()
    personLinkedList.addElement(element: Person(name: "11", age: 11))
    personLinkedList.addElement(element: Person(name: "22", age: 12))
    personLinkedList.addElement(element: Person(name: "33", age: 13))
    personLinkedList.addElement(element: Person(name: "44", age: 14))
    personLinkedList.addElement(element: Person(name: "55", age: 15))
    personLinkedList.addElement(element: Person(name: "00", age: 99), index: 0)
    personLinkedList.addElement(element: Person(name: "##", age: 88), index: 6)
    print("1:\(personLinkedList)")
    
//
//    personLinkedList.clear()
//
//    print("2:\(personLinkedList)")
//
    personLinkedList.addElement(element: Person(name: "??", age: 11))
    print("2:\(personLinkedList)")
//
//    var personToRemove = personLinkedList.remove(at: 0)
//    print("3:\(personToRemove)")
//
    print("4:\(personLinkedList.indexOfElement(element: Person(name: "55", age: 15)))")
    personLinkedList.clear()
    print("5:\(personLinkedList)")
    print("6:\(personLinkedList.indexOfElement(element: Person(name: "55", age: 15)))")
    
    
    personLinkedList.addElement(element: Person(name: "AA", age: 15))
    personLinkedList.addElement(element: Person(name: "BB", age: 15))
    personLinkedList.addElement(element: Person(name: "CC", age: 15))
    personLinkedList.addElement(element: Person(name: "DD", age: 15), index: 0)
    personLinkedList.addElement(element: Person(name: "EE", age: 15), index: 4)
    print("7:\(personLinkedList)")
    //let personToRemove = personLinkedList.remove(at: 0)
    //print("3:\(personToRemove)")
    
    
    var personToRemove = personLinkedList.remove(at: 0)
    print("8:\(personToRemove)")
    print("9:\(personLinkedList)")
    personToRemove = personLinkedList.remove(at: 3)
    print("10:\(personToRemove)")
    print("11:\(personLinkedList)")
    
    var personToSet = personLinkedList.set(element: Person(name: "==", age: 88), at: 0)
    print("12:\(personToSet)")
    print("13:\(personLinkedList)")
    personToSet = personLinkedList.set(element: Person(name: "??", age: 88), at: 2)
    print("14:\(personToSet)")
    print("15:\(personLinkedList)")
    //personToSet = personLinkedList.set(element: Person(name: "??", age: 88), at: 3)
    
    print("16:\(personLinkedList.getElement(at: 0))")
    print("16:\(personLinkedList.getElement(at: 1))")
    print("16:\(personLinkedList.getElement(at: 2))")
    
    print("17:\(personLinkedList.indexOfElement(element: Person(name: "??", age: 88)))")
    
    print("18:\(personLinkedList.indexOfElement(element: Person(name: "==", age: 88)))")
    
    print("19:\(personLinkedList.indexOfElement(element: Person(name: "==?", age: 88)))")
    
    print("20:\(personLinkedList.contanisElement(element: Person(name: "==?", age: 88)))")
    print("21:\(personLinkedList.contanisElement(element: Person(name: "==", age: 88)))")
    
}

testLinkedList()

