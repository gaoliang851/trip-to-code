package com.algorithm.Test;

import com.algorithm.List.ArrayList;
import com.algorithm.List.SignleCycleLinkedList;

public class ArrayListTest {

    public static void main(String[] args) {
        testArrayList();
    }

    public static void testArrayList() {
        SignleCycleLinkedList<Integer> list = new SignleCycleLinkedList();
        list.add(10);//[10]
        list.add(50);//[10,50]
        list.add(60);//[10,50,60]
        list.add(80);//[10,50,60,80]
        list.add(100);// [10,50,60,80，100]
        list.add(-20); // [10,50,60,80,100，-20]
        list.add(0,12);// [12，10,50,60,80,100，-20]
        list.add(7,99);// [12，10,50,60,80,100,-20,99]
        System.out.println(list);
        list.remove(0);// [10,50,60,80,100,-20,99]
        System.out.println(list);
        list.remove(list.size() - 1);// [10,50,60,80,100,-20]
        System.out.println(list);

        list.set(2,20); // [10,50,20,80,100,-20]
        System.out.println(list);

        list.set(0,0);
        System.out.println(list); // [0,50,20,80,100,-20]
        list.set(4,77); // [0,50,20,80,77,-20]
        System.out.println(list);


        System.out.println(list.indexOf(-20));

        System.out.println(list.get(4));

        System.out.println(list.contains(22));

        System.out.println(list.contains(80));

        list.clear();

        System.out.println("is empty :" + list.isEmpty());
    }

}
