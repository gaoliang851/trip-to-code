//
//  GLPerson.m
//  动态方法解析
//
//  Created by mac on 2021/6/25.
//

#import "GLPerson.h"
#import <objc/runtime.h>

@implementation GLPerson

//- (void) other {
//    NSLog(@"%@",NSStringFromSelector(_cmd));
//    NSLog(@"%s",__func__);
//}
//
//+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    if (sel == @selector(abc)) {
//        Method method = class_getInstanceMethod(self, @selector(other));
//        class_addMethod(self,
//                        sel,
//                        method_getImplementation(method),
//                        method_getTypeEncoding(method));
//        return  YES;
//    }
//    return [super resolveInstanceMethod:sel];
//}

void other(id self,SEL _cmd) {
    NSLog(@"%@",NSStringFromSelector(_cmd));
    NSLog(@"self=%@",self);
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(abc)) {
        class_addMethod(self,
                        sel,
                        /* C语言的函数名就是函数地址 */
                        (IMP)other,
                        "v16@0:8");
        return  YES;
    }
    return [super resolveInstanceMethod:sel];
}
@end
