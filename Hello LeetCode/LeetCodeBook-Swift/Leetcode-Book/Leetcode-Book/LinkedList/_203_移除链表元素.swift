//
//  _203_移除链表元素.swift
//  Leetcode-Book
//
//  Created by gaoliang on 2022/1/20.
//

import Foundation

class _203_移除链表元素_Solution {
    
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        let dummy = ListNode(val - 1, head)
        var node: ListNode? = dummy
        
        while node?.next != nil {
            if node?.next!.val == val {
                node?.next = node?.next?.next
            } else {
                node = node?.next
            }
        }
        
        return dummy.next
    }
}

func test_203_移除链表元素_Solution() {
//    let head = switchNumbersToLists(nums: [1,2,6,3,4,5,6])
    let head = switchNumbersToLists(nums: [7,7,7,7])
    
    print(_203_移除链表元素_Solution().removeElements(head, 7))
}
