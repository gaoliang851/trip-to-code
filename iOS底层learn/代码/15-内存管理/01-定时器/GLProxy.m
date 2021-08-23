//
//  GLProxy.m
//  01-定时器
//
//  Created by mac on 2021/8/21.
//

#import "GLProxy.h"

@implementation GLProxy
+ (instancetype) proxyWithTarget:(id)target {
    GLProxy *proxy = [[GLProxy alloc] init];
    proxy.target = target;
    return proxy;
}
/**
 利用消息转发机制:
 当定时器调用代理对象的selector方法时，由于代理对象并未实现该方法，
 回来到消息转发阶段。将该方法转发给target即可。
 */
- (id)forwardingTargetForSelector:(SEL)aSelector {
    return self.target;
}
@end
