package com.algorithm.链表;

/**
 * https://leetcode-cn.com/problems/remove-linked-list-elements/
 */
public class _203_移除链表元素 {
    public ListNode removeElements(ListNode head, int val) {
        ListNode newHead = new ListNode(0);
        newHead.next = head;
        ListNode current = newHead;

        while (current.next != null) {
            if (current.next.val == val) {
                current.next = current.next.next;
            } else {
                current = current.next;
            }
        }

        return newHead.next;
    }

    //自己写的
    public ListNode removeElements1(ListNode head, int val) {
        ListNode newHead = new ListNode(0);
        newHead.next = head;
        ListNode node = head;

        ListNode prev = newHead;

        while (node != null) {
            if (node.val == val) {
                prev.next = node.next;
                node = node.next;
            } else {
                prev = node;
                node = node.next;
            }
        }

        return newHead.next;
    }
}
