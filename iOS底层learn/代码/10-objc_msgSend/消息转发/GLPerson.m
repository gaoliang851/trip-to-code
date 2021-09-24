//
//  GLPerson.m
//  动态方法解析
//
//  Created by mac on 2021/6/25.
//

#import "GLPerson.h"
#import <objc/runtime.h>
#import "GLCat.h"

@implementation GLPerson

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if (aSelector == @selector(abc)) {
        //返回的值不为nil,objc_msgSend(返回值,aSelector);
        return [[GLCat alloc] init];
    }
    return [super forwardingTargetForSelector:aSelector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    //如果返回nil，则会调用doesNotRecognizeSelector:抛出异常错误。
    //如果返回值不为nil，则进入下一步骤
    if (aSelector == @selector(abc)) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    // NSInvocation封装了一个方法调用，
    // 包括：方法调用者、方法名、方法参数
    // anInvocation.target 方法调用者
    // anInvocation.selector 方法名
    // [anInvocation getArgument:NULL atIndex:0]
    
    //可以转发给新的target
    //[anInvocation invokeWithTarget:[[GLCat alloc] init]];
    
    //也可以执行其他的逻辑
    NSLog(@"other..");
}




@end
