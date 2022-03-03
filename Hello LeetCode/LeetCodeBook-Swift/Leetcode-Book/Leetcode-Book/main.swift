//
//  main.swift
//  Leetcode-Book
//
//  Created by gaoliang on 2021/11/24.
//

import Foundation


let l1_2 = ListNode(4, nil)
let l1_1 = ListNode(2, l1_2)
let l1_0 = ListNode(1, l1_1)
// 1,2,4

let l2_2 = ListNode(4, nil)
let l2_1 = ListNode(3,l2_2)
let l2_0 = ListNode(1, l2_1)
//1,3,4

let l3_2 = ListNode(9, nil)
let l3_1 = ListNode(8,l3_2)
let l3_0 = ListNode(-1, l3_1)
//1,3,4

//let node = mergeTwoLists_offical(l1_0, l2_0)

//let node = _23_合并K个升序链表().mergeKLists_2([l1_0,l2_0,l3_0])



//let node = _23_合并K个升序链表_Solution().mergeKLists(switchListsOfLinkedList(nums: [[],[],[],[],[],[],[],[],[],[],[]]))

//let node = _206_反转链表_Solution().reverseList(l1_0)

//let node = _25_K个一组翻转链表_Solution().reverseKGroup(l1_0, 2)
//
//print(node)

//_86_分割链表_Solution_test()
//test_142_环形链表2_Solution()
test_203_移除链表元素_Solution()
