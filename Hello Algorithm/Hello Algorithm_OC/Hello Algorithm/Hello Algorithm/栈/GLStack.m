//
//  GLStack.m
//  Hello Algorithm
//
//  Created by mac on 2021/9/9.
//

#import "GLStack.h"
#import "GLSignleLinkedList.h"
@implementation GLStack {
    //内部链表（用ArrayList,linkedList实现均可）
    GLSignleLinkedList *_list;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        _list = [[GLSignleLinkedList alloc] init];
    }
    return self;
}
- (int)size {
    return [_list size];
}
- (BOOL)isEmpty {
    return [_list isEmpty];
}
- (void)push:(id)element {
    [_list addElement:element];
}
- (id)pop {
    return [_list removeAtIndex:([_list size] - 1)];
}
- (id)top {
    return [_list getElementAtIndex:([_list size] - 1)];
}
- (void)clear {
    [_list clear];
}
- (NSString *)description {
    return [_list description];
}
@end
