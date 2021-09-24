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

//testLinkedList()


func testCycleLinkedList()  {
    let list = CycleLinkedList<String>()
    list.add(element: "11")
    list.add(element: "22")
    list.add(element: "33")
    list.add(element: "44")
    list.add(element: "55")
    list.add(element: "00", index: 0)
    list.add(element: "##", index: 6)
    print(list)
    print(list.remove(index: 0))
    
    print(list.remove(index: list.size() - 1))
    print(list)
    
    print("index of 11:\(list.indexOf(element: "11"))")
    print("index of ##:\(list.indexOf(element: "##"))")
    print("index of 55:\(list.indexOf(element: "55"))")
    print("get of 0:\(list.get(index: 0))")
    print("get of 4:\(list.get(index: 4))")
    print("get of 2:\(list.get(index: 2))")
    print("remove 2:\(list.remove(index: 2))")
    print(list)
    
    print("set 0 : \(list.set(index: 0, element: "??"))")
    print("set \(list.size() - 1) : \(list.set(index: list.size() - 1, element: "!!"))")
    print("set 2 : \(list.set(index: 2, element: "【】"))")
    print(list)
}

//testCycleLinkedList()

func signleCycleLinkedListTest()  {
    let list = SignleCycleLinkedList<Int>()
    list.add(element: 0) //[0]
    list.add(element: 1) // [0,1]
    list.add(element: 2) // [0,1,2]
    list.add(element: 3)
    list.add(element: 4)
    list.add(element: 5) // [0,1,2,3,4,5]
    
    list.add(element: -1, at: 0)
    list.add(element: 20, at: list.size()) // [-1,0,1,2,3,4,5,20]
    
    list.remove(at: 0) // [0,1,2,3,4,5,20]
    list.remove(at: list.size() - 1) // [0,1,2,3,4,5,20]
    
    list.set(element: 20, at: 2) // [0,1,20,3,4,5,20]
    print(list)
    
    print("indexOf(20):\(list.indexOf(element: 20))")
    
    print("indexOf(120):\(list.indexOf(element: 120))")
    
    print("\(list.containsElement(element: 20))")
    
    print("\(list.containsElement(element: 120))")
    
    list.clear()
    
    print(list)
    
}

//signleCycleLinkedListTest()

//for i in 0..<9 {
//    print("i = \(i)")
//}

func stackTest()  {
    let s = Stack<Int>()
    
    s.push(element: 1)
    s.push(element: 2)
    s.push(element: 3)
    s.push(element: 4)
    s.push(element: 5)
    
    print(s.pop())
    print(s.pop())
    print(s.pop())
    print(s.pop())
    
    print(s)
    
}

stackTest()




