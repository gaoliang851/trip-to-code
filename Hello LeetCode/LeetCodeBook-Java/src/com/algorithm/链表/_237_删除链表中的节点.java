package com.algorithm.链表;

/*
* https://leetcode-cn.com/problems/delete-node-in-a-linked-list/
*
* https://github.com/MisterBooo/LeetCodeAnimation/blob/master/0237-Delete-Node-in-a-Linked-List/Article/0237-Delete-Node-in-a-Linked-List.md
*
* */
public class _237_删除链表中的节点 {

    public void deleteNode(ListNode node) {
        node.val = node.next.val;
        node.next = node.next.next;
    }

}
