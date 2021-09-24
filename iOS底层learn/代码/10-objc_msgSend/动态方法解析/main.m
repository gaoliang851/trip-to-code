//
//  main.m
//  动态方法解析
//
//  Created by mac on 2021/6/25.
//

#import <Foundation/Foundation.h>
#import "GLPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        GLPerson *person = [[GLPerson alloc] init];
//        [person abc];
        NSLog(@"%@",[NSObject forwardingTargetForSelector:@selector(test)]);
    }
    return 0;
}
