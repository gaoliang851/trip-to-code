//
//  main.m
//  04-捕获局部static变量
//
//  Created by mac on 2021/3/15.
//

#import <Foundation/Foundation.h>


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        auto int age = 10;
        static int weight = 20;
        
        void(^block)(void) = ^(void){
            NSLog(@"age is %d, weight is %d",age,weight);
        };
        
        age = 30;
        weight = 40;
        
        block(); //age is 10, weight is 40
        
    }
    return 0;
}
