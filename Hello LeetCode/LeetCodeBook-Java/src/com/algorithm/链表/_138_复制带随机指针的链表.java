package com.algorithm.链表;

import java.util.HashMap;
import java.util.Map;

/**
 * https://leetcode-cn.com/problems/copy-list-with-random-pointer/
 */

public class _138_复制带随机指针的链表 {

    public static void main(String[] args) {
        Node head = new Node(7);
        Node node_1 = new Node(13);
        Node node_2 = new Node(11);
        Node node_3 = new Node(10);
        Node node_4 = new Node(1);

        head.next = node_1;
        head.random = null;
//        head.index = 0;

        node_1.next = node_2;
        node_1.random = head;
//        node_1.index = 1;

        node_2.next = node_3;
        node_2.random = node_4;
//        node_2.index = 2;

        node_3.next = node_4;
        node_3.random = node_2;
//        node_3.index = 3;

        node_4.next = null;
        node_4.random = head;
//        node_4.index = 4;

        new _138_复制带随机指针的链表().copyRandomList2(head);

    }

    /*
    * 解法2：利用哈希表建立对应关系
    * */
    public Node copyRandomList2(Node head) {
        Map<Node,Node> nodeMap = new HashMap<>();
        //第一步，根据原链表遍历创建新节点，将key = oldNode,value = newNode 存入一个哈希表
        Node p = head;
        while (p != null) {
            Node copyNode = new Node(p.val);
            nodeMap.put(p,copyNode);
            p = p.next;
        }

        //第二步，遍历哈希表，为copyNode 建立新的关系
        // copyNode.next = map[oldNode.next].value
        // copyNode.random = map[oldNode.randrom]
        for (Node oldNode: nodeMap.keySet()) {
            Node newNode = nodeMap.get(oldNode);
            if (oldNode.next != null) {
                newNode.next = nodeMap.get(oldNode.next);
            }
            if (oldNode.random != null) {
                newNode.random = nodeMap.get(oldNode.random);
            }
        }

        return nodeMap.get(head);
    }



    /*
    * 解法1 ：
    * */
    public Node copyRandomList1(Node head) {

        //第一步，根据原链表遍历创建新节点，使原链表的next -> 新创建的节点，新创建的节点.next -> 原节点.next
        Node current = head;
        while (current != null) {
            Node copyNode = new Node(current.val);

            copyNode.next = current.next;
            current.next = copyNode;
            current = copyNode.next;
        }
        //第二步，设置新创建的节点的random, copyNode.random = oldNode.random.next,还要判断oldNode.random是否为空
        current = head;
        while (current != null && current.next != null) {
            Node copyNode = current.next;
            if (current.random != null) {
                copyNode.random = current.random.next;
            } else {
                copyNode.random = null;
            }
            current = current.next.next;
        }

        //第三步：从链表中分离后来创建的节点
        Node dummy = new Node(0);
        current = head;
        Node p = dummy;
        while (current != null) {
            p.next = current.next;
            p = p.next;
            current.next = p.next;
            current = current.next;
        }

        return dummy.next;
    }



    private static class Node {
        int val;
        Node next;
        Node random;

        public Node(int val) {
            this.val = val;
            this.next = null;
            this.random = null;

        }


    }
}

