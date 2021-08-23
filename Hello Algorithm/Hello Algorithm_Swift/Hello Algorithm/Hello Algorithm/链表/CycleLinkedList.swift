//
//  CycleLinkedList.swift
//  Hello Algorithm
//
//  Created by mac on 2021/8/20.
//

import Foundation

public let CYCLE_LINKED_LIST_NOT_FONUD = -1

fileprivate class CycleLinkedListNode <T: Equatable> : CustomStringConvertible {
    var next: CycleLinkedListNode?
    var element: T
    var prev: CycleLinkedListNode?
    init(next: CycleLinkedListNode?,element: T,prev: CycleLinkedListNode?) {
        self.prev = prev
        self.element = element
        self.next = next;
    }
    
    var description: String {
        var des = ""
        if let thePrev = prev {
            des = des.appending("\(thePrev.element)")
        } else {
            des = des.appending("nil")
        }
        
        des = des.appending("_")
        des = des.appending("【\(element)】");
        des.append("_")
        
        if let theNext = next {
            des = des.appending("\(theNext.element)")
        } else {
            des = des.appending("nil")
        }
        
        return des
    }
}

class CycleLinkedList <T: Equatable> : CustomStringConvertible {
    private var _size = 0 //链表节点的数量
    private var _first: CycleLinkedListNode<T>? //链表的头结点
    private var _last: CycleLinkedListNode<T>? //链表的尾结点
    
    //MARK: - 查
    
    /// 链表的节点数量
    /// - Returns: description
    func size() -> Int {
        _size
    }
    
    /// 链表是否为空
    /// - Returns: description
    func isEmpty() -> Bool {
        _size == 0
    }
    
    
    /// 链表中是否含有element
    /// - Parameter element: element
    /// - Returns: result
    func contains(element: T) -> Bool {
        !(indexOf(element: element) == CYCLE_LINKED_LIST_NOT_FONUD)
    }
    
    
    /// 获取元素element的索引
    /// - Parameter element: element
    /// - Returns: index
    func indexOf(element: T) -> Int {
        if isEmpty() {
            return CYCLE_LINKED_LIST_NOT_FONUD
        }
        
        var node = _first
        for i in 0..._size {
            if let theNode = node {
                if theNode.element == element {
                    return i
                }
            }
            node = node?.next
        }
        
        return CYCLE_LINKED_LIST_NOT_FONUD
    }
    
    
    /// 获取指定索引的元素
    /// - Parameter index: index
    /// - Returns: element
    func get(index: Int) -> T {
        nodeAt(index: index).element
    }
    
    //MARK: - 增加
    
    /// 向链表中指定索引处增加元素
    /// - Parameters:
    ///   - element: element
    ///   - index: index
    /// - Returns: void
    func add(element: T,index: Int) -> Void {
        /*
         对于一般情况（非头节点、尾结点）可以使用如下代码
         let node = nodeAt(index: index) //获取index位置的节点
         let prev = node.prev // node的前置节点
         //创建新的节点，并试 newNode.prev = node.prev, newNode.next = node
         let newNode = CycleLinkedListNode(next: node, element: element, prev: prev)
         //令node.prev = newNode
         node.prev = newNode
        */
        
        //插入的位置是最后
        if index == _size {
            let oldLast = _last
            let newNode = CycleLinkedListNode(next: nil, element: element, prev: _last)
            _last = newNode
            // 考虑原链表 isEmpty的情况，oldLast不为空，则链表不为空
            if let realOldLast = oldLast {
                realOldLast.next = newNode
            }
            //oldLast为空，原链表为空
            else {
                _first = newNode
            }
        } else {
            let node = nodeAt(index: index)
            let newNode = CycleLinkedListNode(next: node, element: element, prev: node.prev)
            let oPrev = node.prev
            node.prev = newNode
            //如果prv不为空，则说明插入的节点不是头结点
            if let prev = oPrev {
                prev.next = newNode
            }
            //如果prev为空,则说明插入的节点是头结点
            else {
                _first = newNode
            }
        }
        _size = _size + 1
    }
    
    /// 向链表最后的位置增加节点
    /// - Parameter element: element
    /// - Returns: void
    func add(element: T) -> Void {
        add(element: element, index: _size)
    }
    
    // MARK: - 删除
    
    /// 移除index索引的元素
    /// - Parameter index: index
    /// - Returns: description
    func remove(index: Int) -> T {
        let node = nodeAt(index: index)
        let elementToRemove = node.element
        let oPrev = node.prev
        let oNext = node.next
        oPrev?.next = oNext
        oNext?.prev = oPrev
        if oPrev == nil { //prev节点为空,则说明移除的是头结点
            _first = oNext
        }
        if oNext == nil { //next节点为空，则说明移除的是尾结点
            _last = oPrev
        }
        _size = _size - 1
        return elementToRemove
    }
    
    func clear() -> Void {
        _first = nil
        _last = nil
        _size = 0
    }
    
    //MARK: - 改
    
    /// 修改index索引的元素
    /// - Parameters:
    ///   - index: index
    ///   - element: element
    /// - Returns: old element
    func set(index:Int, element: T) -> T {
        let node = nodeAt(index: index)
        let oldElement = node.element
        node.element = element
        return oldElement
    }
    
    //MARK: - overwrite
    var description: String {
        var des = "Size = \(_size),["
        var oNode = _first
        for _ in 0..<_size {
            if let node = oNode {
                des = des.appending(node.description)
                des = des.appending(",")
                oNode = node.next
            }
        }
        des = des.appending("]")
        return des
    }
    
    //MARK: - private
    
    ///  获取指定索引的node
    /// - Parameter index: index
    /// - Returns: node
    private func nodeAt(index: Int) -> CycleLinkedListNode<T> {
        //检查index的合法性
        checkIndex(index: index)
        var node: CycleLinkedListNode<T>
        
        // 如果index小于size的一半，则正向遍历
        if index < (_size >> 1) {
            node = _first!
            for _ in 0..<index {
                node = node.next!
            }
        } else {
            node = _last!
            for _ in (index..<(_size - 1)).reversed() {
                node = node.prev!
            }
        }
        return node
    }
    
    
    /// 检查索引是否合法
    /// - Parameter index: index
    /// - Returns: void
    private func checkIndex(index: Int) -> Void {
        if index < 0 || index > _size - 1 {
            fatalError("index:\(index) is out of bounds(size = \(_size))")
        }
    }
    
}
