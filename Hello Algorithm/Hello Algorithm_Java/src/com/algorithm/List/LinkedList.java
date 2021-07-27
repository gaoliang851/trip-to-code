package com.algorithm.List;

import javax.xml.bind.Element;

/*
 * 链表
 */
public class LinkedList<E> {

    //没有找到的标识
    public static final int ELEMENT_NOT_FOUND = -1;

    //用来记录节点的数量
    private int size;
    //头结点
    Node<E> first;


    /*
     * 获取节点的数量
     * */
    public int size() {
        return size;
    }

    /*
     * 获取当前链表是否为空
     * */
    public boolean isEmpty() {
        return size == 0;
    }

    /*
     * 查询链表是否报告该element
     * */
    public boolean contains(E element) {
        return indexOf(element) != ELEMENT_NOT_FOUND;
    }

    /*
     * 获取该element的索引
     * */
    public int indexOf(E element) {
        //若头结点为null，则找不到element
        if (isEmpty()) {
            return ELEMENT_NOT_FOUND;
        }
        Node node = first;
        //遍历链表，对比element

        if (element == null) { //当element为空需要特殊判断
            for (int i = 0; i < size; i++) {
                if (node.element == element) return i;
                node = node.next;
            }
        } else  {
            for (int i = 0; i < size; i++) {
                if (node.element.equals(element)) return i;
                node = node.next;
            }
        }
        return ELEMENT_NOT_FOUND;
    }

    /*
     * 获取给定索引的数据
     * */
    public E get(int index) {
        Node<E> node = node(index);
        return node.element;
    }

    /*
     * 添加element
     * */
    public void add(E element) {
        //相当于往最后添加element
        add(size, element);
    }

    /*
     * 将element添加到指定索引index
     * */
    public void add(int index, E element) {
        //向头结点插入
        if (index == 0) {
            first = new Node<>(element,first);;
        } else {
            //向其他位置插入节点，先获取(index - 1)节点
            Node<E> prev = node(index - 1);
            //将新创建的节点插入index处。
            prev.next = new Node<>(element,prev.next);
        }
        size++;
    }

    /*
     * 删除指定索引的数据，并返回
     * */
    public E remove(int index) {
        E element;
        //头结点要特殊考虑
        if (index == 0 && !isEmpty()) {
            element = first.element;
            first = first.next;
        } else {
            //先获取前面一个节点
            Node<E> prev = node(index - 1);
            //获取要删除节点的数据
            element = prev.next.element;
            //prev.next指向next.next
            prev.next = prev.next.next;
        }
        size--;
        return element;
    }

    /*
     * 清除所有元素
     * */
    public void clear() {
        size = 0;
        first = null;
    }

    /*
     * 设置index位置的元素
     * */
    public E set(int index, E element) {
        Node<E> node = node(index);
        E oldElement = node.element;
        node.element = element;
        return oldElement;
    }

    @Override
    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("size=").append(size).append(",[");
        Node<E> node = first;
        while (node != null){
            stringBuilder.append(node.element).append(",");
            node = node.next;
        }
        stringBuilder.append("]");
        return stringBuilder.toString();
    }

    private static class Node<E> {
        //数据存放
        E element;
        //指向下一个节点
        Node<E> next;

        public Node(E element, Node<E> next) {
            this.element = element;
            this.next = next;
        }
    }

    //######## private Method


    /*
    *  获取给定索引的node
    * */
    private Node node(int index) {
        checkRange(index);
        Node<E> node = first;
        for (int i = 0; i < index; i++) {
            node = node.next;
        }
        return node;
    }


    private void checkRange(int index) {
        if (index < 0 || index > size - 1) {
            throw new IndexOutOfBoundsException("index: " + index + "越界,Size=" + size);
        }
    }



}
