package com.algorithm.stack;

import com.algorithm.List.ArrayList;

public class Stack <E>{
    //内部使用list(arrayList 和 linkedList均可)
    private ArrayList<E> list;
    public Stack() {
        list = new ArrayList<>();
    }

    /**
     * 获取栈内节点的数量
     * @return
     */
    public int size() {
        return list.size();
    }

    /**
     * 获取栈是否是空的
     * @return
     */
    public boolean isEmpty() {
        return list.isEmpty();
    }

    /**
     * 入栈
     * @param element
     */
    public void push(E element) {
        list.add(element);
    }

    /**
     * 出栈
     * @return
     */
    public E pop() {
        return list.remove(list.size() - 1);
    }


    /**
     * 获取栈顶元素
     * @return
     */
    public E top() {
        return list.get(list.size() - 1);
    }

    /**
     * 清空栈
     */
    public void clear() {
        list.clear();
    }

    @Override
    public String toString() {
        return list.toString();
    }
}
