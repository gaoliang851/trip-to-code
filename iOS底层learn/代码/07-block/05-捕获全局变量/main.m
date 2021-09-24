//
//  main.m
//  05-捕获全局变量
//
//  Created by mac on 2021/3/15.
//

#import <Foundation/Foundation.h>

static int weight_ = 10;

int age_ = 10;//全局变量
int main(int argc, const char * argv[]) {
    void(^block)(void) = ^(void) {
        NSLog(@"%d",age_);
    };
    age_ = 15;
    block();//15
    return 0;
}
