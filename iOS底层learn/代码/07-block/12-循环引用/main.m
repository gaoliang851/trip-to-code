//
//  main.m
//  12-循环引用
//
//  Created by mac on 2021/4/6.
//

#import <Foundation/Foundation.h>
#import "GLPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        GLPerson *person = [[GLPerson alloc] init];
        person.age = 10;
        person.block = ^{
            NSLog(@"age is %d",person.age);
        };
        
    }
    NSLog(@"------");
    return 0;
}
