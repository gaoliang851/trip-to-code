//
//  main.m
//  06-关联对象
//
//  Created by mac on 2021/2/1.
//

#import <Foundation/Foundation.h>
#import "NSObject+Tag.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSObject *obj = [[NSObject alloc] init];
        obj.tag = @"abc";
        NSLog(@"%@",obj.tag);//abc
    }
    return 0;
}
