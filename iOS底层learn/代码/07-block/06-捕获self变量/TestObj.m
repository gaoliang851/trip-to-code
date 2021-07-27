//
//  TestObj.m
//  06-捕获self变量
//
//  Created by mac on 2021/3/15.
//

#import "TestObj.h"

@implementation TestObj

- (void) test {
    void(^block)(void) = ^(void) {
        NSLog(@"--%@",self);
    };
    block();
}

@end
