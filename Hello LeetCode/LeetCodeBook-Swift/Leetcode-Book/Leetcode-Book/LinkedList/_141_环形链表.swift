//
//  _141_环形链表.swift
//  Leetcode-Book
//
//  Created by gaoliang on 2022/1/18.
//

import Foundation

// https://leetcode-cn.com/problems/linked-list-cycle/
class _141_环形链表_Solution {
    
    /// 快慢指针
    func hasCycle(_ head: ListNode?) -> Bool {
        var fast = head?.next
        var slow = head
        
        while fast != nil && slow != nil {
            if fast == slow {
                return true
            } else {
                fast = fast?.next?.next
                slow = slow?.next
            }
        }
        return false
    }
    
    /// 通过哈希表
    func _hasCycle(_ head: ListNode?) -> Bool {
        var hashMap = [ListNode:ListNode]()
        
        var node = head
        
        while node != nil {
            /// 如果有
            if hashMap[node!] != nil {
                return true
            } else {
                hashMap[node!] = node
            }
            node = node?.next
        }
        
        return false
    }
}
