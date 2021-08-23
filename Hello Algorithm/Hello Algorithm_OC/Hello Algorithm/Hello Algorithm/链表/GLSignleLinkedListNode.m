//
//  GLLinkedListNode.m
//  Hello Algorithm
//
//  Created by mac on 2021/7/20.
//

#import "GLSignleLinkedListNode.h"

@implementation GLSignleLinkedListNode

- (instancetype)initWithElement:(id) element
                        andNext:(GLSignleLinkedListNode *)next
{
    self = [super init];
    if (self) {
        _element = element;
        _next = next;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@", self.element];
}

@end
