//
//  _206_反转链表.swift
//  Leetcode-Book
//
//  Created by gaoliang on 2021/12/9.
//

import Foundation


class _206_反转链表_Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var cur = head
        var prev: ListNode? = nil
        
        while cur != nil {
            let next = cur?.next
            cur?.next = prev
            prev = cur
            cur = next
        }
        
        return prev
    }
}
