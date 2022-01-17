//
//  _25_K 个一组翻转链表.swift
//  Leetcode-Book
//
//  Created by gaoliang on 2021/11/30.
//

import Foundation

/// - source: https://leetcode-cn.com/problems/reverse-nodes-in-k-group/
/// 
class _25_K个一组翻转链表_Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        let dummy = ListNode(0,head)
        
        var prev: ListNode? = dummy
        var end: ListNode? = dummy
        
        while (end?.next != nil) {
        
            /// 判断当前节点数量是否大于K
            for _ in 0..<k {
                if end == nil {
                    break;
                } else {
                    end = end!.next
                }
            }
            
            /// 走到这里就是大于K
            /// 记录这一组的头结点
            let start = prev?.next
            // 记录下一组的头结点
            let next = end!.next
            /// 断开本组和下一组的链接
            end?.next = nil
            /// 反转
            prev?.next = reverseList(start)
            
            start?.next = next
            prev = start
        }
        
        return dummy.next
    }
    
    /// 反转链表
    private func reverseList(_ head: ListNode?) -> ListNode? {
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
