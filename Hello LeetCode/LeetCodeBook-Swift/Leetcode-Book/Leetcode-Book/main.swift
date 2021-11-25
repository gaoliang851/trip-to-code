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

let node = mergeTwoLists_offical(l1_0, l2_0)

print(node)
