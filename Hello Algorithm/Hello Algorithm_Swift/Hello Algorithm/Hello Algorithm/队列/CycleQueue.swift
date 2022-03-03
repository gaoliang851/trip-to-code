//
//  CycleQueue.swift
//  Hello Algorithm
//
//  Created by gaoliang on 2022/2/23.
//

import AppKit

fileprivate class StaticArray<E> {
    var array: Array = [E?]()
    // 容量
    var _capacity: Int
    init(capacity: Int) {
        _capacity = capacity
        initializeArray()
    }
    
    private func initializeArray() {
        for _ in 0..<_capacity {
            array.append(nil)
        }
    }
    
    subscript(index: Int) -> E? {
        get {
            array[index]
        }
        set {
           array[index] = newValue
        }
    }
    
    var count: Int {
        array.count
    }
    
}

fileprivate let CYCLE_QUEUE_DEFAULT_LENGTH = 5


/// 循环队列
class CycleQueue <E>  {
    // 用来存放元素的数组
    private var elements = StaticArray<E>(capacity: CYCLE_QUEUE_DEFAULT_LENGTH)
    // 队头指向
    private var front = 0
    // 队列长度
    private var size = 0
    
    // MARK:  Public
    
    /// 队列中元素的数量
    /// - Returns:
    func getSize() -> Int {
        size
    }
    
    /// 队列是否为空
    /// - Returns:
    func isEmpty() -> Bool {
        size == 0
    }
    
    
    /// 清空队列
    func clear() {
        size = 0
        front = 0
        elements = StaticArray<E>(capacity: CYCLE_QUEUE_DEFAULT_LENGTH)
        
    }
    
    /// 获取队列的队头
    /// - Returns:
    func getFront() -> E {
        elements[front]!
    }
    
    func enQueue(element: E)  {
        ensureCapacity(size + 1)
        elements[frontOffset(size)] = element
        size += 1
    }
    
    func deQueue() -> E {
        print("current front is \(front)")
        let element = elements[front]
        elements[front] = nil
        front = frontOffset(1)
        print("new front is \(front)")
        size -= 1
        return element!
    }
    
    func toString() -> String {
        var string = "capcacity=\(elements.count),"
        string.append("size=\(size),")
        string.append("front=\(front), [")
        for i in 0..<elements.count {
            if i != 0 {
                string.append(",")
            }
            if let element = elements[i] {
                string.append("\(element)")
            } else {
                string.append("nil")
            }
        }
        string.append("]")
        return string
    }
    
    // MARK:  Private
    private func frontOffset(_ idx: Int) -> Int {
        (front + idx) % elements.count
    }
    
    private func ensureCapacity(_ capacity: Int) {
        if elements.count >= capacity {
            return
        }
        let newCapacity = elements.count + elements.count >> 1
        let newElements = StaticArray<E>(capacity: newCapacity)
        for i in 0..<size {
            newElements[i] = elements[frontOffset(i)]
        }
        front = 0
        elements = newElements
    }
    
}
// MARK: - Test
func test_cycleQueue() {
    
    let cycleQueue = CycleQueue<Int>()
    
    cycleQueue.enQueue(element: 11)
    cycleQueue.enQueue(element: 22)
    cycleQueue.enQueue(element: 33)
    cycleQueue.enQueue(element: 44)
    cycleQueue.enQueue(element: 55)
    cycleQueue.enQueue(element: 66)
    
    print(cycleQueue.toString())
    
    for _ in 0..<3 {
        print(cycleQueue.deQueue())
    }
    
    print(cycleQueue.toString())

    print(cycleQueue.getFront())
    
    cycleQueue.enQueue(element: 77)
    cycleQueue.enQueue(element: 88)
    cycleQueue.enQueue(element: 99)
    cycleQueue.enQueue(element: 11111)
    cycleQueue.enQueue(element: 22222)
    
    print(cycleQueue.toString())
    
}
