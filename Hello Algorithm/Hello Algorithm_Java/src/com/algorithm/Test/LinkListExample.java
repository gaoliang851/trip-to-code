package com.algorithm.Test;

import com.algorithm.List.ArrayList;
import com.algorithm.List.LinkedList;
import sun.awt.image.ImageWatched;

public class LinkListExample {

    public static void main(String[] args) {
        LinkedList<Integer> linkedList = new LinkedList<>();
        linkedList.add(10);
        linkedList.add(50);
        linkedList.add(60);
        linkedList.add(80);
        linkedList.add(100);
        linkedList.add(-20);
        linkedList.add(0,12);
        linkedList.add(7,99);
        System.out.println(linkedList);

        linkedList.remove(0);
        System.out.println(linkedList);

        linkedList.remove(linkedList.size() - 1);
        System.out.println(linkedList);

        linkedList.clear();
        System.out.println(linkedList);

        linkedList.add(11);
        linkedList.add(22);
        linkedList.add(33);
        linkedList.add(44);
        linkedList.add(55);
        System.out.println(linkedList);

        linkedList.set(2,20);
        System.out.println(linkedList);

        linkedList.set(0,0);
        System.out.println(linkedList);
        linkedList.set(4,10);
        System.out.println(linkedList);


        System.out.println("size = " + linkedList.size());


        System.out.println(linkedList.indexOf(-2));

        System.out.println(linkedList.get(4));

        System.out.println(linkedList.contains(22));

        System.out.println(linkedList.contains(99));

        linkedList.clear();

        System.out.println("is empty :" + linkedList.isEmpty());
    }
}
