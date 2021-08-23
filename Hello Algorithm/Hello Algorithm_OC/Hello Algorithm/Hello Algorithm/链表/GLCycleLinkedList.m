//
//  GLCycleLinkedList.m
//  Hello Algorithm
//
//  Created by mac on 2021/8/20.
//

#import "GLCycleLinkedList.h"
#import "GLListIndexOutOfBoundsException.h"



#pragma mark - inner class

@interface GLCycleLinkedListNode : NSObject
@property (strong,nonatomic) GLCycleLinkedListNode *next;
@property (weak,nonatomic) GLCycleLinkedListNode *prev;
@property (strong,nonatomic) id item;
@end
@implementation GLCycleLinkedListNode
- (instancetype)initWithPrev:(GLCycleLinkedListNode *)prev
                     andNext:(GLCycleLinkedListNode *)next
                     andItem:(id)item {
    self = [super init];
    if (self) {
        self.prev = prev;
        self.next = next;
        self.item = item;
    }
    return self;
}

- (NSString *)description
{
    NSMutableString *des = [NSMutableString string];
    
    if (self.prev) {
        [des appendFormat:@"%@",self.prev.item];
    } else {
        [des appendString:@"nil"];
    }
    
    [des appendFormat:@"_"];
    [des appendFormat:@"%@",self.item];
    [des appendFormat:@"_"];
    
    if (self.next) {
        [des appendFormat:@"%@",self.next.item];
    } else {
        [des appendString:@"nil"];
    }
    
    return des;
}
@end



@implementation GLCycleLinkedList {
    // 链表的数量
    int _size;
    //头结点
    GLCycleLinkedListNode *_first;
    //尾结点
    GLCycleLinkedListNode *_last;
}

#pragma mark - 查

- (int)size {
    return _size;
}

- (BOOL)isEmpty {
    return _size == 0;
}

- (BOOL)containsElement:(id)element {
    NSLog(@"%d",[self indexOfElement:element]);
    return [self indexOfElement:element] != GLCYCLELINKEDLIST_NOT_FOUND;
}

- (id)getElementAtIndex:(int)index {
    return [[self __nodeAtIndex:index] item];
}

- (int)indexOfElement:(id)element {
    GLCycleLinkedListNode *node = _first;
    for (int i = 0; i < _size; i++) {
        if (element) { //如果element不为空
            NSLog(@"index:%d-%@",i,element);
            if ([[node item] isEqual:element]) {
                return i;
            }
        } else {//如果element不为空
            if (![node item]) {
                return i;
            }
        }
        node = node.next;
    }
    return GLCYCLELINKEDLIST_NOT_FOUND;
}

#pragma mark - 增加

- (void)addElement:(id)element atIndex:(int)index {
    //如果插入的位置在最后
    if (index == _size) {
        GLCycleLinkedListNode *oldLast = _last;
        _last = [[GLCycleLinkedListNode alloc] initWithPrev:oldLast
                                                    andNext:nil
                                                    andItem:element];
        if (!oldLast) { //oldLast == nil,则说明链表为nil
            _first = _last;
        } else { //链表不为空
            oldLast.next = _last;
        }
    } else { //其他情况
        GLCycleLinkedListNode *node = [self __nodeAtIndex:index];
        GLCycleLinkedListNode *newNode = [[GLCycleLinkedListNode alloc] initWithPrev:node.prev
                                                                             andNext:node
                                                                             andItem:element];
        node.prev = newNode;
        if (newNode.prev == nil) {//即index = 0
            _first = newNode;
        } else {
            newNode.prev.next = newNode;
        }
    }
    _size++;
}

- (void)addElement:(id)element {
    [self addElement:element atIndex:_size];
}

#pragma mark - 删除
- (void)clear {
    _first = nil;
    _last = nil;
    _size = 0;
}

- (id)removeAtIndex:(int)index {
    
    GLCycleLinkedListNode *node = [self __nodeAtIndex:index];
    GLCycleLinkedListNode *prev = node.prev;
    GLCycleLinkedListNode *next = node.next;
    
    if (!prev) { //pre为nil,移除的是头结点
        _first = next;
        next.prev = nil;
    } else {
        prev.next = next;
    }
    
    if (!next) {//next为nil，移除则是尾结点
        _last = prev;
        prev.next = nil;
    } else {
        next.prev = prev;
    }
    
    _size--;
    
    return nil;
}

#pragma mark - 改
- (id)setElement:(id)element atIndex:(int)index {
    GLCycleLinkedListNode *node = [self __nodeAtIndex:index];
    id oldElement = node.item;
    node.item = element;
    return oldElement;
}

#pragma mark - private
/// 检查index是否合法
/// @param index index description
- (void)__checkIndex:(int)index {
    if (index < 0 || index > _size - 1) {
        @throw [GLListIndexOutOfBoundsException exeptionWithIndex:index];
    }
}

/// 获取指定索引位置的node
/// @param index index description
- (GLCycleLinkedListNode *)__nodeAtIndex:(int)index {
    [self __checkIndex:index];
    GLCycleLinkedListNode *node;
    //索引小于_size的一半，正向遍历
    if (index < (_size >> 1)) {
        node = _first;
        for (int i = 0; i < index; i++) {
            node = [node next];
        }
    } else { //反之，则反向遍历
        node = _last;
        for (int i = _size - 1; i > index; i--) {
            node = [node prev];
        }
    }
    return node;
}

- (NSString *)description
{
    NSMutableString *des = [NSMutableString string];
    
    [des appendFormat:@"Size = %d,[",_size];
    
    GLCycleLinkedListNode *node = _first;
    for (int i = 0; i < _size; i++) {
        [des appendFormat:@"%@,",node];
        node = node.next;
    }
    
    [des appendString:@"]"];
    
    return des;
}

@end
