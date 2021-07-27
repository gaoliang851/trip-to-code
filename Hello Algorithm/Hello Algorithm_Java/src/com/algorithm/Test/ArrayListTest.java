package com.algorithm.Test;

import com.algorithm.List.ArrayList;

public class ArrayListTest {

    public static void main(String[] args) {
        testArrayList();
    }

    public static void testArrayList() {
        ArrayList<Integer> arrayList = new ArrayList();
        arrayList.add(10);
        arrayList.add(50);
        arrayList.add(60);
        arrayList.add(80);
        arrayList.add(100);
        arrayList.add(-20);
        arrayList.add(0,12);
        arrayList.add(7,99);
        System.out.println(arrayList);
        arrayList.remove(0);
        System.out.println(arrayList);
        arrayList.remove(arrayList.size() - 1);
        System.out.println(arrayList);
        arrayList.clear();
        System.out.println(arrayList);
        arrayList.add(11);
        arrayList.add(22);
        arrayList.add(33);
        arrayList.add(44);
        arrayList.add(55);
        System.out.println(arrayList);

        arrayList.set(2,20);
        System.out.println(arrayList);

        arrayList.set(0,0);
        System.out.println(arrayList);
        arrayList.set(4,10);
        System.out.println(arrayList);


        System.out.println("size = " + arrayList.size());


        System.out.println(arrayList.indexOf(-2));

        System.out.println(arrayList.get(4));

        System.out.println(arrayList.contains(22));

        System.out.println(arrayList.contains(99));

        arrayList.clear();

        System.out.println("is empty :" + arrayList.isEmpty());
    }

}
