//
//  Stack.swift
//  Hello Algorithm
//
//  Created by mac on 2021/9/9.
//



class Stack <E : Equatable> : CustomStringConvertible {
    private var _list : LinkedList<E>
    init() {
        _list = LinkedList()
    }
    
    
    /// 获取栈内节点的数量
    /// - Returns:
    public func size() -> Int {
        _list.getSize()
    }
    
    
    /// 判断栈是否为空
    /// - Returns:
    public func isEmpty() -> Bool {
        _list.isEmpty()
    }
    
    /// 入栈
    /// - Parameter element:
    /// - Returns:
    public func push(element: E) -> Void {
        _list.addElement(element: element)
    }
    
    /// 出栈
    /// - Returns:
    public func pop() -> E {
        _list.remove(at: (_list.getSize() - 1))
    }
    
    /// 获取栈顶元素
    /// - Returns:
    public func top() -> E {
        _list.getElement(at: (_list.getSize() - 1))
    }
    
    /// 清空栈
    public func clear() {
        _list.clear()
    }
    
    var description: String {
        _list.description
    }
    
    
}
