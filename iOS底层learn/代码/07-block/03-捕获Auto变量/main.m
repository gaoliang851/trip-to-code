//
//  main.m
//  03-捕获Auto变量
//
//  Created by mac on 2021/3/15.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int age = 10;
        void (^block)(void) = ^(void) {
            NSLog(@"age is %d",age);
        };
        age = 20;
        block(); //age is 10
    }
    return 0;
}
