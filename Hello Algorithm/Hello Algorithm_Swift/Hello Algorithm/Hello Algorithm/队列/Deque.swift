//
//  Deque.swift
//  Hello Algorithm
//
//  Created by gaoliang on 2022/2/22.
//


/// 双端队列
/// 能在头尾两端添加、删除的队列
class Deque<E: Equatable> {
    private lazy var _list = CycleLinkedList<E>()
    
    /// 元素的数量
    /// - Returns:
    func size() -> Int {
        _list.size()
    }
    
    func isEmpty() -> Bool {
        _list.isEmpty()
    }
    
    func clear() {
        _list.clear()
    }
    
    
    /// 从队尾入队
    /// - Parameter element:
    func enQueueRear(_ element: E) {
        _list.add(element: element)
    }
    
    /// 从对头入队
    /// - Parameter element:
    func enQueueFront(_ element: E) {
        _list.add(element: element, index: 0)
    }
    
    /// 从队尾出队
    /// - Returns:
    func deQueueRear() -> E {
        _list.remove(index: _list.size() - 1)
    }
    
    /// 从对头出队
    /// - Returns:
    func deQueueFront() -> E {
        _list.remove(index: 0)
    }
    
    
    /// 获取队列的尾元素
    /// - Returns:
    func rear() -> E {
        _list.get(index: _list.size() - 1)
    }
    
    /// 获取队列的头元素
    /// - Returns:
    func front() -> E {
        _list.get(index: 0)
    }
}

func test_deque() -> Void {
    let queue = Deque<Int>()
    queue.enQueueFront(11)
    queue.enQueueRear(22)
    queue.enQueueRear(33)
    queue.enQueueFront(44)
    
    /*尾33，22，11，44 头*/
    
    print("?? -> \(queue.front())")
    
    while !queue.isEmpty() {
        print(queue.deQueueRear())
    }
}
