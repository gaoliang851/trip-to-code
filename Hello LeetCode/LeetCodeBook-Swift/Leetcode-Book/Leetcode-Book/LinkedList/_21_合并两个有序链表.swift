//
//  _21_合并两个有序链表.swift
//  Leetcode-Book
//
//  Created by gaoliang on 2021/11/24.
//

import Foundation

/// https://leetcode-cn.com/problems/merge-two-sorted-lists/
/// 21. 合并两个有序链表
/// [示例图片](https://assets.leetcode.com/uploads/2020/10/03/merge_ex1.jpg)
/// 示例1：
/// 输入：l1 = [1,2,4], l2 = [1,3,4]
/// 输出：[1,1,2,3,4,4]
class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        mergeTwoLists_offical(l1, l2)
    }
}

/// Solution 我自己的解法
/// 1. 建立一个虚拟头结点
/// 2. 循环 -> 只要两个链表均不为空，每次循环就能取到一个最小值点拼接到虚拟头结点链表结尾
func mergeTwoLists_myself(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
    // 如果l1的链表为nil
    if l1 == nil {
        return l2
    }
    // 如果l2的链表为nil
    if l2 == nil {
        return l1
    }
    
    let vhead = ListNode(0, nil) // 虚拟头结点
    var end = vhead
    
    var one = l1
    var other = l2
    
    
    // 找出下一个节点拼接在vhead的末尾上
    // 能找出下一个节点的条件是还有节点，即两条链表不同时为nil
    while !(one == nil && other == nil) {
        var nextNode :ListNode?
        
        // one为nil,则other必然不为nil
        if one == nil {
            nextNode = other
            other = other?.next
        } else if other == nil {//other为nil,则one必然不为nil
            nextNode = one
            one = one?.next
        } else { //one和other同时不为nil
            if one!.val <= other!.val {
                nextNode = one
                one = one?.next
            } else {
                nextNode = other
                other = other?.next
            }
        }
        
        // 此时nextNode是必然不为nil的
        end.next = nextNode
        end = end.next!
    }
    
    return  vhead.next
}


/// Solution 官方的解法
/// 当 l1 和 l2 都不是空链表时，
/// 判断 l1 和 l2 哪一个链表的头节点的值更小，
/// 将较小值的节点添加到结果里，
/// 当一个节点被添加到结果里之后，将对应链表中的节点向后移一位。
/// 在循环终止的时候,至多有一个是非空的。
/// 由于输入的两个链表都是有序的，所以不管哪个链表是非空的，
/// 它包含的所有元素都比前面已经合并链表中的所有元素都要大。
/// 这意味着我们只需要简单地将非空链表接在合并链表的后面，并返回合并链表即可。
func mergeTwoLists_offical(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
    // 如果l1的链表为nil
    if l1 == nil {
        return l2
    }
    // 如果l2的链表为nil
    if l2 == nil {
        return l1
    }
    
    let vhead = ListNode(0, nil) // 虚拟头结点
    var end = vhead
    
    var one = l1
    var other = l2
    
    
    while (one != nil && other != nil) {
        let next: ListNode
        if one!.val <= other!.val {
            next = one!
            one = one?.next
        } else {
            next = other!
            other = other?.next
        }
        end.next = next
        end = next
    }
    
    //遍历完成后至多还剩一个链表，把另外一个链表链接上就可以
    end.next = one == nil ? other:one
    
    return  vhead.next
}
