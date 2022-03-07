//
//  _232_用栈实现队列.swift
//  Leetcode-Book
//
//  Created by 高亮 on 2022/3/7.
//

// https://leetcode-cn.com/problems/implement-queue-using-stacks/

class _232_用栈实现队列_MyQueue {
    private var inStack = [Int]()
    private var outStack = [Int]()
    
    func push(_ x: Int) {
        inStack.append(x)
    }
    
    func pop() -> Int {
        /// 如果 出栈 为空，就把
        if outStack.isEmpty {
            // 将 入栈 倒序放入 出栈 中
            outStack.append(contentsOf: inStack.reversed())
            // 清空 入栈
            inStack.removeAll()
        }
        return outStack.removeLast()
    }
    
    func peek() -> Int {
        outStack.isEmpty ? inStack[0] : outStack[outStack.count - 1]
    }
    
    func empty() -> Bool {
        inStack.isEmpty && outStack.isEmpty
    }
}

func test_232_用栈实现队列_MyQueue() {
    let queue = _232_用栈实现队列_MyQueue()
    
//    for i in 0..<10 {
//        queue.push(i)
//    }
//
//    for _ in 0..<5 {
//        print(queue.pop())
//    }
//
//    for i in 0..<12 {
//        queue.push(i)
//    }
//
//    print(queue.peek())
//
//    while !queue.empty() {
//        print(queue.pop())
//    }
    queue.push(1)
    queue.push(2)
    queue.push(3) // 1 2 3
    
    print(queue.peek()) //1
    // 2 3
    print(queue.pop()) //  1
    
    print(queue.peek()) // 2
    // 3
    print(queue.pop())
    // 3
    print(queue.peek())
    print(queue.empty())
    
    print(queue.pop())
    print(queue.empty())
}
