//
//  GLProxys.m
//  01-定时器
//
//  Created by mac on 2021/8/21.
//

#import "GLProxys.h"

@implementation GLProxys
+ (instancetype) proxyWithTarget:(id)target {
    //NSProxy没有init方法，创建时使用alloc即可
    GLProxys *proxy = [GLProxys alloc];
    proxy.target = target;
    return proxy;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [self.target methodSignatureForSelector:sel];
}
- (void)forwardInvocation:(NSInvocation *)invocation {
    [invocation invokeWithTarget:self.target];
}

@end
