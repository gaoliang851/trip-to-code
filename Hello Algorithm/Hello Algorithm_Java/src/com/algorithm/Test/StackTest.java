package com.algorithm.Test;

import com.algorithm.stack.Stack;

public class StackTest {

    public static void main(String[] args) {
        testStack();
    }

    public static void testStack() {
        Stack<Integer> stack = new Stack<>();
        stack.push(1);
        stack.push(2);
        stack.push(3);
        stack.push(4);
        System.out.println(stack.pop());
        System.out.println(stack.pop());
        System.out.println(stack.pop());
        System.out.println(stack);
    }

}
