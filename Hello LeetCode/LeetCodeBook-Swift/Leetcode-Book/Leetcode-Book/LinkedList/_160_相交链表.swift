//
//  _160_相交链表.swift
//  Leetcode-Book
//
//  Created by gaoliang on 2022/1/20.
//

import Foundation

// https://leetcode-cn.com/problems/remove-linked-list-elements/
class _160_相交链表_Solution {
    
    /// 双指针解法
    func _getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var nodeA = headA
        var nodeB = headB
    
        while nodeA !== nodeB {
            nodeA = nodeA != nil ? nodeA?.next : headB
            nodeB = nodeB != nil ? nodeB?.next : headA
        }
        
        return nodeA
    }
    
    /// 哈希表
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var hashMap = [ListNode:ListNode]()
        
        var node = headA
        
        while node != nil {
            hashMap[node!] = node
            node = node?.next
        }
        
        node = headB
        
        while node != nil {
            if hashMap[node!] != nil {
                return node
            }
            node = node?.next
        }
        
        return node
    }
}

func test_160_相交链表_Solution() {
    let headA = switchNumbersToLists(nums: [2,6,4])
    let headB = switchNumbersToLists(nums: [1,5])
    let node = _160_相交链表_Solution().getIntersectionNode(headA, headB)
    print(node)
}
