package com.algorithm.链表;

/**
 *
 */
public class _876_链表的中间结点 {
    public ListNode middleNode(ListNode head) {
        ListNode slow = head;
        ListNode fast = head;
        while (fast != null && fast.next != null) {
            fast = fast.next.next;
            slow = slow.next;
        }
        return slow;
    }

    public ListNode middleNode1(ListNode head) {
        ListNode[] nodes = new ListNode[100];
        ListNode node = head;
        int index = 0;
        while (node != null) {
            nodes[index] = node;
            node = node.next;
            index++;
        }
        return nodes[index / 2];
    }

}
