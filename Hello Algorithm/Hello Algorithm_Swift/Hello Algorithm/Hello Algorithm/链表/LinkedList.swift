//
//  LinkedList.swift
//  Hello Algorithm
//
//  Created by mac on 2021/7/20.
//

import Foundation

enum LinkedListError: Error {
    case indexOutOfBoundsException(String)
}

public let LINKED_LIST_NOT_FOUND = -1

/// 链表节点类
fileprivate class LinkedListNode <T: Equatable> : CustomStringConvertible {
    /// 要保存的数据
    var element: T
    /// next指针
    var next: LinkedListNode?
    
    init(element: T,next: LinkedListNode?) {
        self.element = element
        self.next = next
    }
    
    var description: String {
        return "\(element)"
    }
    
}

public class LinkedList <T:Equatable> :CustomStringConvertible {
    /// 用来记录链表的的节点数量
    private var size: Int = 0
    /// 头结点
    private var first: LinkedListNode<T>?

    //MARK: - 增加
    
    /// 向链表最后(index = size)添加一个数据节点
    /// - Parameter element: element
    func addElement(element: T) {
         addElement(element: element, index: size)
    }
    
    func addElement(element: T,index: Int) {
        /// 这里要对index == 0做判断
        if index == 0 { //向首节点插入
            first = LinkedListNode(element: element, next: first)
        }
        else { //向其他位置插入
            //1. 先获取前节点
            let prev = node(index: index - 1)
            prev.next = LinkedListNode(element: element, next: prev.next)
        }
        size = size + 1
        
    }
    
    //MARK: - 删
    
    /// 删除指定索引的数据
    /// - Parameter at: 索引
    /// - Returns: 删除的数据
    func remove(at index: Int) -> T {
        //要对index == 0做判断
        var element: T;
        //index = 0,链表不为空，则必有首节点
        if index == 0 && !isEmpty() {
            element = first!.element
            first = first!.next
        } else {
            checkRange(index: index)
            // 获取 (index - 1)的节点
            let prev = node(index: (index - 1))
            // 获取要移除的数据
            element = prev.next!.element
            // node.next指向 要移除节点的next
            prev.next = prev.next?.next
        }
        size = size - 1
        return element
    }
    
    /// 清空链表
    func clear()  {
        first = nil
        size = 0
    }
    
    //MARK: - 改
    func set(element: T,at index: Int) -> T {
        /// 找到index节点
        let nodeToSet = node(index: index)
        /// 获取旧数据句柄
        let oldElement = nodeToSet.element
        /// 设置新数据
        nodeToSet.element = element
        /// 返回旧数据
        return oldElement
    }
    
    //MARK: - 查
    
    /// 获取链表节点数量
    /// - Returns: size
    func getSize() -> Int {
        size
    }
    
    /// 判断链表是否为空
    /// - Returns: empty
    func isEmpty() -> Bool {
        size == 0
    }
    
    func contanisElement(element: T) -> Bool {
        !(indexOfElement(element: element) == LINKED_LIST_NOT_FOUND)
    }
    
    
    /// 获取index节点的数据
    /// - Parameter index: index
    /// - Throws: error
    /// - Returns: element
    func getElement(at index: Int) -> T {
        node(index: index).element
    }
    
    
    /// 获取element的索引
    /// - Parameter element: element
    /// - Returns: index
    func indexOfElement(element: T) -> Int {
        // 遍历链表中的节点
        var node = first;
        for i in 0...size {
            if node?.element == element {
                return i
            }
            node = node?.next
        }
        return LINKED_LIST_NOT_FOUND
    }
    
    
    //MARK: - private
    func checkRange(index: Int) {
        if index < 0 || index > size - 1 {
            fatalError("index out of range:\(index)");
        }
    }
    
    
    /// 获取索引为index的node
    /// - Parameter index: index
    /// - Returns: node
    private func node(index: Int) -> LinkedListNode<T> {
        /// 检查索引合法性
        checkRange(index: index)
        /// 遍历链表
        var node = first!;
        for _ in 0..<index {
            if let nextNode = node.next {
                node = nextNode
            } else {
                break
            }
        }
        return node;
    }
    
    //MARK: -
    public var description: String {
        var des = ""
        des.append("size = \(size),[")
        var node = first
        for _ in 0...size {
            if let listNode = node {
                des.append("\(listNode.element)")
                des.append(",")
                node = listNode.next
            }
        }
        des.append("]")
        return des
    }
}
