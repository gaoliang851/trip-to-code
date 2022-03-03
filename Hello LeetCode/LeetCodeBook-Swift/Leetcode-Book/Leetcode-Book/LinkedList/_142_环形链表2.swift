//
//  _142_环形链表2.swift
//  Leetcode-Book
//
//  Created by gaoliang on 2022/1/18.
//

import Foundation

/// https://leetcode-cn.com/problems/linked-list-cycle-ii/solution/huan-xing-lian-biao-ii-by-leetcode-solution/
/// 
class _142_环形链表2_Solution {
    
    /// 快慢指针
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var fast = head?.next
        var slow = head
        
        while fast != nil && slow != nil { // [3,2,0,4]
            
            print("fast = \(fast!.val), slow = \(slow!.val)")
            
            if fast == slow {
                return fast
            } else {
                fast = fast?.next?.next
                slow = slow?.next
            }
        }
        
        return nil
    }
    
    /// 使用哈希表
    /// - Parameter head:
    /// - Returns:
    func _detectCycle(_ head: ListNode?) -> ListNode? {
        var hashMap = [ListNode:ListNode]()
        
        var node = head
        while node != nil {
            if hashMap[node!] != nil {
                return node
            } else {
                hashMap[node!] = node!
            }
            node = node?.next
        }
        return nil
    }
}

func test_142_环形链表2_Solution() {
    let l0 = ListNode(3)
    let l1 = ListNode(2)
    let l2 = ListNode(0)
    let l3 = ListNode(4)
    
    l0.next = l1
    l1.next = l2
    l2.next = l3
    l3.next = l1
    
    _142_环形链表2_Solution().detectCycle(l0)
    
}
