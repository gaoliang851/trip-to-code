//
//  NSMutableArray+Extension.m
//  方法实现交换示例
//
//  Created by mac on 2021/7/20.
//

#import "NSMutableArray+Extension.h"
#import <objc/runtime.h>
@implementation NSMutableArray (Extension)

+ (void)load {
    Class cls = NSClassFromString(@"__NSArrayM");
    Method old = class_getInstanceMethod(cls, @selector(insertObject:atIndex:));
    Method new = class_getInstanceMethod(cls, @selector(gl_insertObject:atIndex:));
    method_exchangeImplementations(old, new);
}

- (void)gl_insertObject:(id)anObject atIndex:(NSUInteger)index {
    
    if (!anObject) return;
    [self gl_insertObject:anObject atIndex:index];
}

@end
