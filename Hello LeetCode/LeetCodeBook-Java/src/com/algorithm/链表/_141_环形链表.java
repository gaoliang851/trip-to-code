package com.algorithm.链表;

/**
 * https://leetcode-cn.com/problems/linked-list-cycle/
 */
public class _141_环形链表 {

    public boolean hasCycle(ListNode head) {
        if (head == null || head.next == null) return false;

        ListNode slowNode = head;

        ListNode fastNode = head.next;

        // 这里条件判断不能用 ||，要用 &&,比如链表 [1,2]
        while (fastNode != null || fastNode.next != null) {
            if (slowNode == fastNode) return true;
            fastNode = fastNode.next.next;
            slowNode = slowNode.next;
        }
        return false;
    }
}
