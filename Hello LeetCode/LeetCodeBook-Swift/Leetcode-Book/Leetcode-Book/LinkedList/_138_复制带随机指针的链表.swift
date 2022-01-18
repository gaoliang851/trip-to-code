//
//  _138_复制带随机指针的链表.swift
//  Leetcode-Book
//
//  Created by gaoliang on 2022/1/17.
//

import Foundation

public class Node {
    public var val: Int
    public var next: Node?
    public var random: Node?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}

extension Node: Hashable, Equatable {
  public func hash(into hasher: inout Hasher) {
    // 用于唯一标识
    hasher.combine(val)
    hasher.combine(ObjectIdentifier(self))
  }
  public static func ==(lhs: Node, rhs: Node) -> Bool {
    return lhs === rhs
  }
}

class _138_复制带随机指针的链表_Solution {
    
    func copyRandomList(_ head: Node?) -> Node? {
        
        var map = [Node:Node]()
        
        /// 遍历，深拷贝
        var node = head
        
        while (node != nil) {
            let newNode = Node(node!.val)
            map[node!] = newNode
            node = node?.next
        }
        
        /// 设置next和 random 指针
        node = head
        while (node != nil) {
            /// 设置next 指针
            map[node!]!.next = node!.next != nil ? map[node!.next!] : nil
            /// 设置 random指针
            map[node!]?.random = node?.random != nil ? map[node!.random!] : nil
            
            node = node?.next
        }
        
        return head == nil ? head : map[head!]
    }
}
