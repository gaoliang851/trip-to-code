//
//  main.m
//  07-block类型
//
//  Created by mac on 2021/3/15.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        void(^block)(void) = ^(void) {
            NSLog(@"Hello");
        };
        NSLog(@"block:%@",[block class]); //__NSGlobalBlock__
        
        int age = 10;
        void(^block1)(void) = ^(void) {
            NSLog(@"age:%d",age);
        };
        
        //MRC环境下输出:__NSStackBlock__
        //ARC环境下输出:__NSMallocBlock__
        //原因是ARC环境下，编译器默认会做很多事。
        NSLog(@"block1:%@",[block1 class]); //__NSStackBlock__
    
        NSLog(@"block2:%@",[[block1 copy] class]);//__NSMallocBlock__
    }
    return 0;
}
