//
//  main.m
//  12 - 3 方法常用的API
//
//  Created by mac on 2021/7/19.
//

#import <Foundation/Foundation.h>
#import "GLPerson.h"
#import <objc/runtime.h>

void myrun(id self,SEL _cmd) {
    NSLog(@"myrun");
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 获取GLPerson实例方法:run
        Method runMethod = class_getInstanceMethod([GLPerson class], @selector(run));
        
        //获取 GLPerson的类方法:printPersonInfo
        Method personInfoMethod = class_getInstanceMethod([GLPerson class], @selector(printPersonInfo));
        
        
        /// 获取方法的相关信息
        // 获取run方法的sel
        SEL runSEL = method_getName(runMethod);
        // 获取run方法的实现
        IMP runImp = method_getImplementation(runMethod);
        
        GLPerson *person = [[GLPerson alloc] init];
        [person run];   //-[GLPerson run]
        
        //使用C语言函数替换实现
        class_replaceMethod([GLPerson class], @selector(run), (IMP)myrun, "v@:");
        [person run];   //myrun
        
        //也可使用block替换实现
        class_replaceMethod([GLPerson class], @selector(run), imp_implementationWithBlock(^(id self,SEL _cmd){
            NSLog(@"self is %@",self);
        }), "v@:");
        [person run]; //self is <GLPerson: 0x1007b85f0>
        
    }
    return 0;
}
