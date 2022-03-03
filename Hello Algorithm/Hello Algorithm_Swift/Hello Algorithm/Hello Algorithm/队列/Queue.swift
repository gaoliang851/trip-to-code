//
//  Queue.swift
//  Hello Algorithm
//
//  Created by gaoliang on 2022/2/17.
//

import Foundation

/// 队列是一种特殊的线性表，只能在`头尾两端`进行操作
/// 队尾(rear):只能从队尾添加元素，一般叫做`enQueue`,入队
/// 对头(front):只能从队头移除元素，一般叫做`deQueue`,出队
/// 先进先出的原则,First In First Out,FIFO

/// 队列可以使用动态数组、链表实现
/// 优先使用双向链表，因为队列主要是往头尾操作元素

/// 队列的接口设计
/// int size();              // 元素的数量
/// boolean isEmpty();       // 是否为空
/// void clear();            // 清空
/// void enQueue(E element); // 入队
/// E deQueue();             // 出队
/// E front();               // 获取队列的头元素

class Queue<E: Equatable> {
    private lazy var list = CycleLinkedList<E>()
    
    /// 元素的数量
    /// - Returns:
    func size() -> Int {
        list.size()
    }
    
    /// 是否为空
    /// - Returns:
    func isEmpty() -> Bool {
        list.isEmpty()
    }
    
    /// 清空
    func clear() {
        list.clear()
    }
    
    /// 入队
    /// - Parameter element:
    func enQueue(element: E) {
        list.add(element: element)
    }
    
    /// 出队, 先入先出
    /// - Returns:
    func deQueue() -> E {
        list.remove(index: 0)
    }
    
    
    /// 获取队列的头元素
    /// - Returns:
    func front() -> E {
        list.get(index: 0)
    }
}


func test_queue()  {
    let queue = Queue<Int>()
    queue.enQueue(element: 1)
    queue.enQueue(element: 2)
    queue.enQueue(element: 3)
    queue.enQueue(element: 4)
    
    print("?? -> \(queue.front())")
    
    while !queue.isEmpty() {
        print(queue.deQueue())
    }
}
