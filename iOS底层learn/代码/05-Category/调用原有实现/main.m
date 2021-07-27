//
//  main.m
//  调用原有实现
//
//  Created by mac on 2021/1/12.
//

#import <Foundation/Foundation.h>
#import "GLObject.h"
#import "GLObject+Test.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        GLObject *obj = [[GLObject alloc] init];
        [obj start]; //Test start
        [obj oldStart]; //GLObject start
    }
    return 0;
}
