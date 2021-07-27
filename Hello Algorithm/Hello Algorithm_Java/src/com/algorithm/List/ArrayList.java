package com.algorithm.List;


public class ArrayList <E> {

    //用来记录存入元素的数量
    private int size;
    //用来存放元素的数组
    private E elements[];
    //默认容量为10
    private static final int DEFAULT_CAPACITY = 10;

    //没有找到的标识
    public static final int ELEMENT_NOT_FOUND = -1;

    /**
     * @param capaticy 数组的容量，如果小于默认容量，则使用默认容量
     *
     */
    public ArrayList(int capaticy) {
        //如果容量小于默认容量，则使用默认容量
        capaticy = capaticy < DEFAULT_CAPACITY ? DEFAULT_CAPACITY:capaticy;
        elements = (E[]) new Object[capaticy];
    }

    /*
     * 无参构造函数，默认容量为 DEFAULT_CAPACITY
     * */
    public ArrayList() {
        this(DEFAULT_CAPACITY);
    }

    /*
    * @description 向数组最后面添加元素
    * @param element 要添加的元素
    * */
    public void add(E element) {
        //向数组最后添加元素，就是像数组index=size添加
        add(size,element);
    }

    /*
    * @description 向数组index的位置，添加元素element
    * @param index
    * @param element
    * */
    public void add(int index,E element) {
        //先检查index是否合法
        checkRangeForAdd(index);
        //再要确保elements的容量有size + 1;
        ensureCapaticy(size + 1);
        //将elements中 [index,size-1]区间内的元素依次向后移一个位置，从最后开始移
        for (int i = size; i > index; i--) {
            elements[i] = elements[i - 1];
        }
        //将element插入到index位置
        elements[index] = element;
        size++;
    }

    /*
    * @description 移除index处的元素
    * */
    public E remove(int index) {
        //首先检查index是否合法
        checkRange(index);
        //先获取index的元素，以便最后返回
        E oldElement = elements[index];
        //将[index+1,size-1]区间的元素依次向前移动一个。
        for (int i = index; i < size - 1; i++) {
            elements[index] = elements[index + 1];
        }
        //更新size
        size--;
        return oldElement;
    }

    /*
    * @description 清空数组中所有元素
    * */
    public void clear() {
        //遍历elements,置为null
        for (int i = 0; i < size - 1; i++) {
            elements[i] = null;
        }
        size = 0;
    }

    public E set(int index, E element) {
        //首先检查index是否合法
        checkRange(index);
        //合法的话，先获取index的旧元素以便最后返回
        E oldElement = elements[index];
        //替换新元素
        elements[index] = element;
        return oldElement;
    }

    /*
    * 获取动态数组中元素的数量
    * */
    public int size() {
        return size;
    }

    /*
    * 判断该数组是不是为空
    * */
    public boolean isEmpty() {
        return size == 0;
    }

    /*
    * @description 判断该数组是否包含元素 element,遍历判断
    * @param element 要比对的元素
    * */
    public boolean contains(E element) {
        return indexOf(element) != ELEMENT_NOT_FOUND;
    }

    /*
    * @description 根据元素返回该元素的下标
    * @param
    * */
    public int indexOf(E element) {
        //首先判断element是否为null
        if (element == null) {
            //遍历数组，找到就返回下标i
            for (int i = 0; i < size; i++) {
                if (elements[i] == null) return i;
            }
        } else {
            //遍历数组，找到就返回下标i
            for (int i = 0; i < size; i++) {
                if (element.equals(elements[i])) return i;
            }
        }
        //如果上面都没找到，返回 ELEMENT_NOT_FOUND
        return ELEMENT_NOT_FOUND;
    }

    /**
     * @description 根据角标获取元素
     * @param index 要查询的角标
     */
    public E get(int index) {
        //首先检查角标是否越界
        checkRange(index);
        return elements[index];
    }

    /*
    * @description 检查index是否合法
    * */
    private void checkRange(int index) {
        if (index > size - 1 || index < 0) {
            throw new ArrayIndexOutOfBoundsException("index: "+ index +"越界,Size=" + size);
        }
    }

    /*
     * @description 对Add操作检查index是否合法，判断的依据为index是否大于0，是否不超过size。
     * */
    private void checkRangeForAdd(int index) {
        if (index < 0 || index > size) {
            throw new ArrayIndexOutOfBoundsException("index: "+ index +"越界,Size=" + size);
        }
    }

    /*
     * @description 确保element有capaticy的容量，如果不够，则进行扩容
     * */
    private void ensureCapaticy(int capaticy) {
        //如果elements长度大于等于capaticy, do nothing
        if (elements.length >= capaticy) return;
        // 如果不够，先创建一个容量为elements 1.5倍的新数组，使用位运算效率要高。
        E[] newElements = (E[]) new Object[elements.length + (elements.length >> 1)];
        // 再将旧元素从elements中已入newElements中
        for (int i = 0; i < elements.length; i++) {
            newElements[i] = elements[i];
        }
        // 用newElements替代elements
        elements = newElements;
    }

    @Override
    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("size:" + size).append(",[");
        for (int i = 0; i < size; i++) {
            E element = elements[i];
            if (i != 0) stringBuilder.append(",");
            stringBuilder.append(element.toString());
        }
        stringBuilder.append("]");
        return stringBuilder.toString();
    }
}
