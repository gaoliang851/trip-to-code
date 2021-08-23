package com.algorithm.List;

import java.lang.ref.SoftReference;

/**
 * 双向循环链表
 */
public class CycleLinkedList<E> {
    // 链表节点的数量
    private int size;
    //首节点
    private Node<E> first;
    //尾结点
    private Node<E> last;

    //没有找到的标识
    public static final int ELEMENT_NOT_FOUND = -1;

    /**
     * 获取链表节点数量
     * @return
     */
    public int size() {
        return size;
    }

    /**
     * 判断链表是否为空
     * @return
     */
    public boolean isEmpty() {
        return size == 0;
    }

    /**
     * 判断链表是否包含数据 element
     * @param element
     * @return
     */
    public boolean contains(E element) {
       return indexOf(element) != ELEMENT_NOT_FOUND;
    }

    /**
     * 获取数据 element的索引
     * @param element
     * @return
     */
    public int indexOf(E element) {
        Node<E> cur = first;
        for (int i = 0; i < size; i++) {
            if (element == null) {
                if (cur.element == null) {
                    return i;
                }
            } else {
                if (cur.element.equals(element)) {
                    return i;
                }
            }
            cur = cur.next;
        }
        return ELEMENT_NOT_FOUND;
    }

    /**
     * 获取指定索引的Node节点
     * @param index
     * @return
     */
    public Node<E> get(int index) {
        return node(index);
    }

    /**
     * 向链表末尾添加数据 element
     * @param element
     */
    public void add(E element) {
        add(element,size);
    }

    /**
     * 向指定索引处添加数据 element
     * @param element
     * @param index
     */
    public void add(E element,int index) {
        if (index == size) { //添加链表最后
            Node<E> oldLast = last;
            last = new Node<>(oldLast,element,null);
            if (oldLast == null) {//链表是空的
                //相当于整个链表只有一个节点,first和last都指向这个节点
                first = last;
            } else {//链表不是空的
                //将之前的last.next -> 新的last
                oldLast.next = last;
            }
        } else {//添加到链表其他位置
            Node<E> node = node(index);
            Node<E> newNode = new Node<>(node.prev,element,node);
            node.prev = newNode;
            //判断是否插在头结点
            if (newNode.prev != null) {
                newNode.prev.next = newNode;
            } else { // index == 0
                first = newNode;
            }
        }
        size++;
    }

    /**
     * 移除指定索引的节点
     * @param index
     */
    public E remove(int index) {
        Node<E> node = node(index);
        /* 对于头结点和尾结点以及普通节点分别判断
        if (node.prev == null) { // index == 0
            first = node.next;
            node.next.prev = null;
        } else if (node.next == null) { //移除尾结点
            node.prev.next = node.next;
            last = node.prev;
        } else {
            node.prev.next = node.next;
            node.next.prev = node.prev;
        }
        */


        /**
         * 对于一般的情况（不考虑头结点和尾结点）：
         * Node<E> next = node.next;
         * Node<E> prev = node.prev;
         * next.prev = prev;
         * prev.next = next;
         * 但是如果考虑头结点和尾结点，next和prev就有可能为null
         * 所以要分别考虑
         */

        Node<E> next = node.next;
        Node<E> prev = node.prev;

        //只有一个节点的情况也是可以满足的

        if (next == null) {//要移除的节点是尾结点
            last = prev;
        } else {
            next.prev = prev;
        }

        if (prev == null) { //要移除的节点是头结点
            first = next;
        } else {
            prev.next = next;
        }

        size--;
        return node.element;
    }

    /**
     * 清空链表
     */
    public void clear() {
        first = null;
        last = null;
        size = 0;
    }

    /**
     * 设置指定索引节点的数据
     * @param index
     * @param element
     * @return
     */
    public E set(int index,E element) {
        Node<E> node = node(index);
        E oldElement = node.element;
        node.element = element;
        return oldElement;
    }

    @Override
    public String toString() {
        StringBuffer sb = new StringBuffer();
        sb.append("size = " + size + ",[");
        Node<E> node = first;
        for (int i = 0; i < size; i++) {
            sb.append(node).append(",");
            node = node.next;
        }
        sb.append("]");
        return sb.toString();
    }

    // private method
    private Node<E> node(int index) {
        checkIndex(index);
        Node<E> node = null;
        //如果靠近头结点，正向遍历
        if (index < (size >> 1)) {
            node = first;
            for (int i = 0; i < index; i++) {
                node = node.next;
            }
        } else  { //如果比较靠近尾结点则反向遍历
            node = last;
            for (int i = size - 1; i > index; i--) {
                node = node.prev;
            }
        }
        return node;
    }

    private void checkIndex(int index) {
        if (index < 0 || index > size - 1) {
            throw new IndexOutOfBoundsException("index: " + index + "越界,Size=" + size);
        }
    }



    private static class Node<E> {
        // 保存的数据
        E element;
        // 后一个指针
        Node<E> next;
        // 前一个节点
        Node<E> prev;

        Node(Node<E> prev,E element, Node<E> next) {
            this.element = element;
            this.next = next;
            this.prev = prev;
        }

        @Override
        public String toString() {
            StringBuffer sb = new StringBuffer();
            if (prev != null) {
                sb.append(prev.element);
            } else {
                sb.append("null");
            }
            sb.append("_").append(element).append("_");
            if (next != null) {
                sb.append(next.element);
            } else {
                sb.append("null");
            }
            return sb.toString();
        }
    }

}
