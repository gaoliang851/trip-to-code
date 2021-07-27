//
//  GLObject+Test.m
//  调用原有实现
//
//  Created by mac on 2021/1/12.
//

#import "GLObject+Test.h"
#import <objc/runtime.h>

@implementation GLObject (Test)
- (void)start {
    NSLog(@"Test start");
}
- (void) oldStart {
    Class clazz = [self class];
    unsigned int methodCount;
    //获取方法类表
    Method *methodList = class_copyMethodList(clazz, &methodCount);
    //倒序遍历方法数组
    for (unsigned int i = methodCount; i > 0; i--) {
        Method method = methodList[i];
        //通过SEL来对比
        SEL methodSel = method_getName(method);
        if ([NSStringFromSelector(methodSel) isEqualToString:NSStringFromSelector(@selector(start))]) {
            //获取方法实现
            IMP last_start_imp = method_getImplementation(method);
            typedef void (*fn)(id,SEL);
            //调用
            fn f = (fn)last_start_imp;
            f(self,methodSel);
            break;
        }
    }
}
@end
