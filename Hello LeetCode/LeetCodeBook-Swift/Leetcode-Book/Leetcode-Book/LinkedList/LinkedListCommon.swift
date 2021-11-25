//
//  LinkedListCommon.swift
//  Leetcode-Book
//
//  Created by gaoliang on 2021/11/25.
//

import Foundation


/// Definition for singly-linked list.
public class ListNode : CustomStringConvertible{
    
    public var val: Int
    
    public var next: ListNode?
    
    public init() {
        self.val = 0
        self.next = nil
    }
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
    
    public var description: String {
        var str = "["
        var current: ListNode? = self
        while current != nil {
            str.append("\(current!.val),")
            current = current?.next
        }
        str.removeLast()
        str.append("]")
        return str
    }
 }
