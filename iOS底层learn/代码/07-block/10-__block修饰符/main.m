//
//  main.m
//  10-__block修饰符
//
//  Created by mac on 2021/3/29.
//

#import <Foundation/Foundation.h>
#import "GLPerson.h"

typedef void(^GLBlock)(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        __block int age = 10;
        
        GLBlock glBlock = ^(void) {
            age = 20;
            NSLog(@"age is %d",age);//age is 20
        };
        glBlock();
        NSLog(@"real age is %d",age);//real age is 20
        
    }
    return 0;
}
