//
//  GLLinkedList.m
//  Hello Algorithm
//
//  Created by mac on 2021/7/20.
//

#import "GLLinkedList.h"
#import "GLLinkedListNode.h"
#import "GLListIndexOutOfBoundsException.h"

@implementation GLLinkedList {
    //头结点
    GLLinkedListNode *_first;
    //节点的数量
    int _size;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _size = 0;
    }
    return self;
}

#pragma mark - 增

/// 在链表结尾增加一个数据节点
/// @param element element
- (void) addElement:(id)element {
    /// 相当于往链表最后(index = _size)插入节点
    [self addElement:element atIndex:_size];
}


/// 向索引为index处插入一个数据节点
/// @param element element
/// @param index index
- (void) addElement:(id)element atIndex:(int)index {
    //0.先判断index == 0的情况
    if (index == 0) {
        _first = [[GLLinkedListNode alloc] initWithElement:element andNext:_first];
    } else {
        //1.先获取索引为(index - 1)处的节点
        GLLinkedListNode *prev = [self nodeWithIndex:index - 1];
        prev.next = [[GLLinkedListNode alloc] initWithElement:element andNext:prev.next];
    }
    // 节点数量增加
    _size++;
    
}

#pragma mark - 删

/// 移除index处的节点
/// @param index index
- (id) removeAtIndex:(int)index {
    [self checkIndex:index];
    
    GLLinkedListNode *nodeToRemove;
    
    if (index == 0) {
        nodeToRemove = _first;
        _first = _first.next;
    } else {
        //1.移除index处的节点,就是将(index-1)的节点指向(index+1)
        GLLinkedListNode *prev = [self nodeWithIndex:index - 1];
        //2. 获取要移除的节点
        nodeToRemove = prev.next;
        //
        prev.next = nodeToRemove.next;
    }
    _size--;
    return nodeToRemove.element;
}

/// 清空链表
- (void) clear {
    _first = nil;
    _size = 0;
}

#pragma mark - 改

/// 修改索引为index节点的数据
/// @param element element
/// @param index index
- (id) setElement:(id)element atIndex:(int)index {
    //1. 获取index处的节点
    GLLinkedListNode *node = [self nodeWithIndex:index];
    //2. 获取index节点的数据
    id oldElement = node.element;
    //3. 修改index节点的数据
    node.element = element;
    //4. 将旧的数据返回
    return oldElement;
}

#pragma mark - 查

/// 获取链表的节点数量
- (int) size {
    return _size;
}

/// 判断当前链表是否为空
- (BOOL) isEmpty {
    return _size == 0;
}

/// 判断当前链表是否包含element
/// @param element element
- (BOOL) containsElement:(id)element {
    
    return [self indexOfElement:element] == GL_LINKED_LIST_NOT_FOUND;
}

/// 获取index节点的数据
/// @param index index
- (id) getElementAtIndex:(int)index {
    return [self nodeWithIndex:index].element;
}

/// 获取element数据的s索引
/// @param element element
- (int) indexOfElement:(id)element {
    
    //若头结点为null，则找不到element
    if ([self isEmpty]) {
        return GL_LINKED_LIST_NOT_FOUND;
    }
    
    GLLinkedListNode *node = _first;
    /// element是否为nil分为两种情况
    //1. element不为nil
    if (element) {
        //1.1 遍历节点判断
        for (int i = 0; i < _size; i++) {
            if ([node.element isEqual:element]) {
                return i;
            } else {
                node = node.next;
            }
        }
    }
    //2. element == nil
    else {
        //2.1 遍历节点判断
        for (int i = 0; i < _size; i++) {
            if (!node.element) {
                return i;
            } else {
                node = node.next;
            }
        }
    }
    
    return 0;
}

#pragma mark - private

/// 检查索引，index不能大于_size
/// @param index index
- (void) checkIndex:(int)index {
    if (index < 0 || index > _size - 1) {
        @throw [GLListIndexOutOfBoundsException exeptionWithIndex:index];
    }
}


/// 获取index处的的节点
/// @param index index
- (GLLinkedListNode *) nodeWithIndex:(int)index {
    [self checkIndex:index];
    GLLinkedListNode *node = _first;
    for (int i = 0; i < index; i++) {
        node = node.next;
    }
    return node;
}

#pragma mark - overwrite
- (NSString *)description {
    NSMutableString *des = [NSMutableString string];
    [des appendFormat:@"size = %d,[",_size];
    GLLinkedListNode *node = _first;
    for (int i = 0; i < _size;i++) {
        [des appendFormat:@"%@,",node.element];
        node = node.next;
    }
    [des appendFormat:@"]"];
    return des;
}


@end
