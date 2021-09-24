//
//  GLCycleSignleLinkedList.m
//  Hello Algorithm
//
//  Created by mac on 2021/9/7.
//

#import "GLCycleSignleLinkedList.h"
#import "GLSignleLinkedListNode.h"



@implementation GLCycleSignleLinkedList {
    // 链表的长度
    int _size;
    // 头结点
    GLSignleLinkedListNode *_first;
}

#pragma mark - 查

/// 获取链表长度
- (int)size {
    return _size;
}

/// 判断链表是否为空
- (BOOL)isEmpty {
    return _size == 0;
}


/// 判断链表是否包含元素element
/// @param element element description
- (BOOL)containsElement:(id)element {
    return [self indexOfElement:element] != ELEMENT_NOT_FOUNT;
}

/// 获取元素element的索引
/// @param element element description
- (int)indexOfElement:(id)element {
    //遍历链表依次判断
    GLSignleLinkedListNode *node = _first;
    for (int i = 0; i < _size; i++) {
        // 判断element是否为nil，分两种情况判断
        if (element) {
            if ([element isEqual:node.element]) {
                return i;
            }
        } else {
            if (!node.element) return i;
        }
        node = node.next;
    }
    return  ELEMENT_NOT_FOUNT;
}

/// 获取指定索引处的元素
/// @param index index description
- (id)getElementAtIndex:(int)index {
    return [self nodeAtIndex:index].element;
}

#pragma mark - 增
/// 将元素添加到链表最后
/// @param element element description
- (void)addElement:(id)element {
    [self addElement:element atIndex:_size];
}


/// 将元素添加到链表指定索引处
/// @param element element description
/// @param index index description
- (void)addElement:(id)element atIndex:(int)index {
    if (index == 0) {
        GLSignleLinkedListNode *newFirst = [[GLSignleLinkedListNode alloc] initWithElement:element andNext:_first];
        //这里要先获取尾结点，因为 nodeAtIndex: 方法中需要用到_first,
        //如果提前更改了_first，后续再试用 nodeAtIndex:
        //获取的数据可能有偏差
        GLSignleLinkedListNode *last = _size == 0 ? newFirst : [self nodeAtIndex:_size - 1];
        _first = newFirst;
        last.next = newFirst;
    } else {
        //先获取index - 1处的节点
        GLSignleLinkedListNode *prev = [self nodeAtIndex:(index - 1)];
        //创建新的节点，并将newNode.next = prev.next
        GLSignleLinkedListNode *newNode = [[GLSignleLinkedListNode alloc] initWithElement:element andNext:prev.next];
        //
        prev.next = newNode;
    }
    _size++;
    
}

#pragma mark - 删
/// 移除指定索引的元素
/// @param index index description
- (id)removeAtIndex:(int)index {
    id elementToRemove = nil;
    if (index == 0) {//移除头节点的情况下
        // 要先获取last节点，因为first节点变动，
        // 而 nodeAtIndex: 方法里面会用到_first节点
        // 所以，如果在变动_first节点之后获取_last会不准确
        GLSignleLinkedListNode *last = [self nodeAtIndex:(_size - 1)];
        _first = _first.next;
        last.next = _first;
    } else { //非头结点的情况下
        GLSignleLinkedListNode *prev = [self nodeAtIndex:(index - 1)];
        elementToRemove = prev.next.element;
        prev.next = prev.next.next;
    }
    _size--;
    return elementToRemove;
}

/// 清空链表
- (void) clear {
    _first = nil;
    _size = 0;
}

#pragma mark - 改
- (id)setElement:(id)element atIndex:(int)index {
    GLSignleLinkedListNode *node = [self nodeAtIndex:index];
    id oldElement = node.element;
    node.element = element;
    return oldElement;
}


#pragma mark - private

- (GLSignleLinkedListNode *)nodeAtIndex:(int) index {
    [self checkRangeForIndex:index];
    GLSignleLinkedListNode *node = _first;
    for (int i = 0; i < index; i++) {
        node = node.next;
    }
    return node;
}

- (void) checkRangeForIndex:(int)index {
    if (index < 0 || index > _size - 1) {
        @throw [NSException exceptionWithName:@"IndexOutOfBounds"
                                       reason:[NSString stringWithFormat:@"Size = %d,index = %d",_size,index]
                                     userInfo:nil];
    }
}

#pragma mark - overwirte
- (NSString *)description {
    NSMutableString *string = [NSMutableString string];
    [string appendFormat:@"Size = %d,[",_size];
    GLSignleLinkedListNode *node = _first;
    for (int i = 0; i < _size; i++) {
        [string appendFormat:@"%@_%@,",node.element,node.next.element];
        node = node.next;
    }
    [string appendString:@"]"];
    return string;
}


@end
