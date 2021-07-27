//
//  UIControl+Extension.m
//  方法实现交换示例
//
//  Created by mac on 2021/7/19.
//

#import "UIControl+Extension.h"
#import <objc/runtime.h>
@implementation UIControl (Extension)

+ (void)load {
    Method oldMethod = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method newMethod = class_getInstanceMethod(self, @selector(gl_sendAction:to:forEvent:));
    method_exchangeImplementations(oldMethod, newMethod);
}

- (void)gl_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    
    //如果是按钮
    if ([self isKindOfClass:[UIButton class]]) {
        //其他处理，埋点
        NSLog(@"action=%@,target=%@",NSStringFromSelector(action),target);
    }
    
    //调用系统原有的实现
    [self gl_sendAction:action to:target forEvent:event];
    
}

@end
