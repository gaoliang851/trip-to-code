//
//  _86_分割链表.swift
//  Leetcode-Book
//
//  Created by gaoliang on 2022/1/17.
//

import Foundation

// 给你一个链表的头节点 head 和一个特定值 x ，请你对链表进行分隔，使得所有 小于 x 的节点都出现在 大于或等于 x 的节点之前。
// 你应当 保留 两个分区中每个节点的初始相对位置。
class _86_分割链表_Solution {
    
    /// small 链表按顺序存储所有小于 x 的节点,large 链表按顺序存储所有大于等于 x 的节点;
    /// 遍历完原链表后，将 small 链表尾节点指向 large 链表的头节点即能完成对链表的分隔。
    
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        ///
        let smallHead = ListNode(0)
        var smallNode: ListNode? = smallHead
        let largerHead = ListNode(0)
        var largeNode: ListNode? = largerHead
        
        var node = head
        
        while (node != nil) {
            if node!.val >= x {
                largeNode?.next = node
                largeNode = node
            } else {
                smallNode?.next = node
                smallNode = smallNode?.next
            }
            
            node = node?.next
        }
        
        largeNode?.next = nil
        
        smallNode?.next = largerHead.next
        
        return smallHead.next
    }
    
    
    /*
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        var node = head
        // [1,4,3,2,5,2]
        // [1,2,3,4,5,2], [1,2,2,4,5,3]
        while (node != nil) {
            /// 找到了一个大数
            if node!.val >= x {
                var tempNode = node
                while (tempNode != nil) {
                    // 找到了小数，小数放到前面，大数依次向后移
                    if tempNode!.val < x {
//                        let temp = tempNode!.val
//                        tempNode!.val = node!.val
//                        node!.val = temp
                        moveSmallVal(node!, tempNode!)
                        break
                    }
                    
                    tempNode = tempNode?.next
                }
            }
            
            node = node?.next
        }
        return head
    }
    
    
    func moveSmallVal(_ start: ListNode, _ end: ListNode) {
        var tempVal = start.val
        /// 把小数先设置到前面
        start.val = end.val
        /// 大数依次往后推
        var node = start.next
        while (start == end) {
            
        }
    }
    */
    
}

func _86_分割链表_Solution_test() {
    let head = switchNumbersToLists(nums: [1,4,3,2,5,2])
    
    let result = _86_分割链表_Solution().partition(head, 3)

    print(result)
}
