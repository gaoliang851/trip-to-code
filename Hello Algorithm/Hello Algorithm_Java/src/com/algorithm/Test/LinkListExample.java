package com.algorithm.Test;

import com.algorithm.List.CycleLinkedList;

public class LinkListExample {

    public static void main(String[] args) {
        CycleLinkedList<Integer> list = new CycleLinkedList<>();
        list.add(10);
        System.out.println(list);
        list.remove(0);
        System.out.println(list);
        list.add(50);
        list.add(60);
        list.add(80);
        list.add(100);
        list.add(-20);
        System.out.println(list);
        list.add(-2,0);
       // list.add(77,7);
        System.out.println(list);
//
//        list.remove(0);
//        System.out.println(list);
//
//        list.remove(list.size() - 1);
//        System.out.println(list);
//
//        list.clear();
//        System.out.println(list);
//
//        list.add(11);
//        list.add(22);
//        list.add(33);
//        list.add(44);
//        list.add(55);
//        System.out.println(list);
//
//        list.set(2,20);
//        System.out.println(list);
//
//        list.set(0,0);
//        System.out.println(list);
//        list.set(4,10);
//        System.out.println(list);
//
//
//        System.out.println("size = " + list.size());
//
//        System.out.println(list.indexOf(-2));
//
//        System.out.println(list.get(4));
//
//        System.out.println(list.contains(22));
//
//        System.out.println(list.contains(99));
//
//        list.clear();
//
//        System.out.println("is empty :" + list.isEmpty());
    }
}
