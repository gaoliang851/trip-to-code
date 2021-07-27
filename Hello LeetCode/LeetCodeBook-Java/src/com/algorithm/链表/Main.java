package com.algorithm.链表;

import com.algorithm.链表.ListNode;

public class Main {

    public static void main(String[] args) {
        int numbers[] = {1,2,3,4,5};
        ListNode head = array2List(numbers);
        printLinkedList("input",head);
        ListNode newHead = (new _206_反转链表()).reverseList(head);
        printLinkedList("output",newHead);
    }

    private static ListNode array2List(int[] numbers) {
        ListNode head = new ListNode(numbers[0]);
        ListNode last = null;
        for (int i = 1;i < numbers.length;i++) {
            ListNode node = new ListNode(numbers[i]);
            if (head.next == null) {
                head.next = node;

            } else {
                last.next = node;
            }
            last = node;
        }
        return head;
    };

    private static void printLinkedList(String tag,ListNode head) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("[");
        while (head != null ){
            stringBuilder.append(head.val).append(",");
            head = head.next;
        }
        stringBuilder.append("]");
        System.out.println(tag + "," + stringBuilder);
    }

}
