//
//  _23_合并K个升序链表.swift
//  Leetcode-Book
//
//  Created by gaoliang on 2021/11/29.
//

import Foundation

///Solution
class _23_合并K个升序链表_Solution {
    
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        mergeKLists_2(lists)
    }
    
    /// 数组内的链表，相邻的依次合并
    private func mergeKLists_1(_ lists: [ListNode?]) -> ListNode? {
        var mergeNode: ListNode?
        
        for i in 0..<lists.count {
            mergeNode = self.mergaTwoList(mergeNode, lists[i])
        }
        
        return mergeNode
    }
    
    /// 数组内，两两合并
    private func mergeKLists_2(_ lists: [ListNode?]) -> ListNode? {
        
        if lists.isEmpty {
            return nil
        }
        
        var mergeLists = lists
        
        while mergeLists.count != 1 {
            var mergeListsTemp = [ListNode?]()
            for i in 0..<mergeLists.count {
                // i = 偶数的情况下，才合并
                if i % 2 == 0 {
                    if i != mergeLists.count - 1 {
                        mergeListsTemp.append(mergaTwoList(mergeLists[i], mergeLists[i + 1]))
                    } else { //最后一个
                        mergeListsTemp.append(mergeLists[i])
                    }
                }
            }
            mergeLists = mergeListsTemp
        }
        
        return mergeLists[0]
    }
    
    /// 合并两个有序数组
    func mergaTwoList(_ oneList: ListNode?, _ otherList: ListNode?) -> ListNode? {
        // 新建虚拟头结点
        let vhead = ListNode(0, nil)
        
        var currentNode = vhead
        var oneNode = oneList
        var otherNode = otherList
        
        while oneNode != nil && otherNode != nil {
            if oneNode!.val <= otherNode!.val {
                currentNode.next = oneNode
                oneNode = oneNode?.next
            } else {
                currentNode.next = otherNode
                otherNode = otherNode?.next
            }
            currentNode = currentNode.next!
        }
        
        currentNode.next = oneNode == nil ? otherNode:oneNode
        
        return vhead.next
    }
}
