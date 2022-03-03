//
//  _234_回文链表.swift
//  Leetcode-Book
//
//  Created by gaoliang on 2022/1/20.
//

import Foundation

class _234_回文链表_Solution {
    // 反转一半
    func isPalindrome(_ head: ListNode?) -> Bool {
        var fast = head
        var slow = head
        
        /// fast走到最后一个,或者fast 已经是nil了
        while  fast != nil && fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        // 此时slow 正好是 中间位置
        // 使用slow 对比栈
        var node = head
        while slow != nil && node != nil {
            if slow?.val != node?.val {
                return false
            }
            node = node?.next
            slow = slow?.next
        }
        return true
    }
}
