//
//  main.m
//  05-捕获全局变量
//
//  Created by mac on 2021/3/15.
//

#import <Foundation/Foundation.h>

int age_ = 10;
static int weight_ = 10;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        void(^block)(void) = ^(void) {
            NSLog(@"%d - %d",age_,weight_);
        };
        
        age_ = 15;
        weight_ = 25;
        
        block();//15 - 25
    }
    return 0;
}
