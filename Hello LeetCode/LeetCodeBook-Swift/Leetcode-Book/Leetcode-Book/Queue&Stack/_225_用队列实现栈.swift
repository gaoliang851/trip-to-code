//
//  _225_用队列实现栈.swift
//  Leetcode-Book
//
//  Created by 高亮 on 2022/3/7.
//
// https://leetcode-cn.com/problems/implement-stack-using-queues/submissions/

class _225_用队列实现栈_MyStack {
    // 模拟队列
    private var queue = [Int]()
    
    init() {}
    // 入栈，加到最后
    func push(_ x: Int) {
        queue.append(x)
    }
    
    // 出栈，从最后出
    func pop() -> Int {
        queue.removeLast()
    }
    // 获取栈顶元素
    func top() -> Int {
        queue[queue.count - 1]
    }
    
    func empty() -> Bool {
        queue.isEmpty
    }
}
