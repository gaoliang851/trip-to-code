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

/// [2,4,5,6]
func switchNumbersToLists(nums: [Int]) -> ListNode? {
    let vhead = ListNode(0, nil)
    var node = vhead
    for i in 0..<nums.count {
        node.next = ListNode(nums[i],nil)
        node = node.next!
    }
    return vhead.next
}

func switchListsOfLinkedList(nums: [[Int]]) -> [ListNode?] {
    var result = [ListNode?]()
    for numberList in nums {
        result.append(switchNumbersToLists(nums: numberList))
    }
    
    return result
}
