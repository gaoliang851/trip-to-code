//
//  SignleCycleLinkedList.swift
//  Hello Algorithm
//
//  Created by mac on 2021/9/7.
//


/// 双向循环链表的内部节点
fileprivate class Node <E: Equatable> {
    // 保存的数据
    var element: E
    // next指针
    var next: Node<E>?
    init(element:E, next: Node?) {
        self.element = element
        self.next = next
    }
}

class SignleCycleLinkedList <E: Equatable> : CustomStringConvertible {
    // 头结点
    private var _first : Node<E>?
    // 链表的长度
    private var _size = 0
    //
    private let ELEMENT_NOT_FOUND = -1
    
    
    // MARK: - 查
    /// 获取链表的长度
    /// - Returns:
    func size() -> Int {
        _size
    }
    
    /// 判断链表是否为空
    /// - Returns:
    func isEmpty() -> Bool {
        _size == 0
    }
    
    /// 判断链表是否包含元素
    /// - Parameter element:
    /// - Returns:
    func containsElement(element: E) -> Bool {
        indexOf(element: element) != ELEMENT_NOT_FOUND
    }
    
    /// 获取element的索引
    /// - Parameter element:
    /// - Returns:
    func indexOf(element: E) -> Int {
        var node = _first
        for i in 0..._size {
            if element == node?.element {
                return i
            }
            node = node?.next
        }
        return ELEMENT_NOT_FOUND
    }
    
    /// 获取指定索引位置的元素
    /// - Parameter index:
    /// - Returns:
    func getElement(at index: Int) -> E {
        nodeAt(index: index).element
    }
    
    // MARK: - 增
    
    /// 添加元素到链表最后
    /// - Parameter element:
    /// - Returns:
    func add(element: E) -> Void {
        add(element: element, at: _size)
    }
    
    /// 添加元素到指定索引处
    /// - Parameters:
    ///   - element:
    ///   - index:
    /// - Returns:
    func add(element: E, at index: Int) -> Void {
        // 头结点插入
        if index == 0 {
            let newFirst = Node(element: element, next: _first)
            // 这里要在 _fisrt指针更改前取尾结点，
            // nodeAt(index:) 里需要用到 _first.
            // _first 更改后会影响 nodeAt(index:)方法的返回值
            let last = _size == 0 ? newFirst : nodeAt(index: (_size - 1))
            last.next = newFirst
            _first = newFirst
        } else { //非头结点插入 [0,1]
            // 获取前一个节点
            let prev = nodeAt(index: (index - 1)) //prev = 1
            // 创建新的节点，并将新节点.next -> prev.next
            let newNode = Node(element: element, next: prev.next)
            prev.next = newNode
        }
        _size = _size + 1
    }
    
    // MARK: - 删
    
    /// 删除指定索引的元素
    /// - Parameter index:
    /// - Returns:
    @discardableResult
    func remove(at index: Int) -> E {
        var elementToRemove: E
        // 头结点移除
        if index == 0 {
            // 获取尾结点
            let last = nodeAt(index: (_size - 1))
            elementToRemove = _first!.element
            _first = _first!.next
            last.next = _first
        } else { // 非头结点移除
            let prev = nodeAt(index: index)
            elementToRemove = prev.next!.element
            prev.next = prev.next!.next
        }
        _size = _size - 1
        return elementToRemove
    }
    
    func clear() -> Void {
        _size = 0
        _first = nil
    }
    
    // MARK: 改
    
    /// 修改指定索引位置的element
    /// - Parameters:
    ///   - element:
    ///   - index:
    /// - Returns:
    @discardableResult
    func set(element: E,at index:Int) -> E {
        let node = nodeAt(index: index)
        node.element = element
        return node.element
    }
    
    // MARK: - private
    fileprivate func nodeAt(index: Int) -> Node<E> {
        checkRange(index: index)
        var node = _first!
        for _ in 0 ..< index {
            node = node.next!
        }
        return node
    }
    
    func checkRange(index: Int) -> Void {
        if index  < 0 || index > (_size - 1) {
            fatalError("Size = \(_size), index = \(index)")
        }
    }
    
    var description: String {
        var des = "Size = \(_size),["
        if let first = _first {
            var node = first
            for _ in 0..._size - 1  {
                des = des.appending("\(node.element)_")
                if let nextNode = node.next {
                    des = des.appending("\(nextNode.element),")
                    node = nextNode
                } else {
                    des = des.appending("nil,")
                }
            }
        }
        des = des.appending("]")
        
        return des
    }
    
}
