package com.algorithm.List;

/**
 * 单向循环链表
 * @param <E>
 */
public class SignleCycleLinkedList<E> {

    private static int ELEMENT_NOT_FOUNT = -1;

    //头结点
    private Node<E> first;
    //链表的长度
    private int size;

    /**
     * 获取链表长度
     */
    public int size() {
        return size;
    }

    /**
     * 判断当前链表是否为空
     * @return
     */
    public boolean isEmpty() {
        return size == 0;
    }

    /**
     * 判断当前链表是否为空
     * @param element
     * @return
     */
    public boolean contains(E element) {
        return indexOf(element) != ELEMENT_NOT_FOUNT;
    }

    /**
     * 获取链表是否包含element元素
     * @param element
     * @return
     */
    public int indexOf(E element) {
        Node<E> node = first;
        for (int i = 0;i < size; i++) {
            if (element == null) {
                if (node.element == null) return i;
            } else {
                if (node.element.equals(element)) return i;
            }
            node = node.next;
        }
        return ELEMENT_NOT_FOUNT;
    }

    /**
     * 获取指定索引的元素
     * @param index
     * @return
     */
    public E get(int index) {
        return node(index).element;
    }

    /**
     * 获取指定索引的节点
     * @param index
     * @return
     */
    private Node<E> node(int index) {
        checkRange(index);
        Node<E> node = first;
        for (int i = 0;i < index; i++) {
            node = node.next;
        }
        return node;
    }

    /**
     * 在链表结尾添加数据element
     * @param element
     */
    public void add(E element) {
        add(size,element);
    }

    /**
     * 向指定索引index处添加元素 element
     * @param element
     * @param index
     */
    public void add(int index,E element) {
        if (index == 0) {//头结点插入
            //创建新的头结点
            Node<E> newFirst = new Node<>(element,first);
            //获取尾结点，如果链表为空，则尾结点就是新节点
            Node<E> lastNode = (size == 0) ? newFirst : node(size - 1);
            //将尾结点.next指向newFirst
            lastNode.next = newFirst;
            first = newFirst;
        } else {//非头结点插入
            //获取到index-1处的节点
            Node<E> prev = node(index - 1);
            Node<E> newNode = new Node<>(element,prev.next);
            prev.next = newNode;
        }
        size++;
    }

    /**
     * 移除指定索引的数据
     * @param index
     * @return
     */
    public E remove(int index) {
        E oldElement = null;
        if (index == 0) { //移除头结点
            // 要先获取last节点，因为first节点变动，
            // 而node(int index)方法里面会用到first节点
            // 所以，如果在变动first节点之后获取last会不准确
            Node<E> last = node(size - 1);
            oldElement = first.element;
            first = first.next;
            last.next = first;
        } else {
            //正常情况下
            Node<E> prev = node(index - 1);
            oldElement = prev.next.element;
            prev.next = prev.next.next;
        }
        size--;
        return oldElement;
    }

    /**
     * 清空链表
     */
    public void clear() {
        first = null;
        size = 0;
    }

    /**
     * 设置index索引处元素
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
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("size=").append(size).append(",[");
        Node<E> node = first;
        for (int i = 0;i < size;i++) {
            stringBuilder.append(node).append(",");
            node = node.next;
        }
        stringBuilder.append("]");
        return stringBuilder.toString();
    }






    /**
     * 检查索引是否合法
     * @param index
     */
    private void checkRange(int index) {
        if (index < 0 || index > size -1) {
            throw new ArrayIndexOutOfBoundsException("size = " + size + ",index = " + index);
        }
    }

    static class Node<E> {
        E element;
        Node<E> next;
        Node(E element,Node<E> next) {
            this.element = element;
            this.next = next;
        }

        @Override
        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append(element).append("_").append(next.element);
            return sb.toString();
        }
    }
}
