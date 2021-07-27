//
//  main.m
//  11-1 super的本质
//
//  Created by mac on 2021/7/11.
//

#import <Foundation/Foundation.h>
#import "GLStudent.h"
#import <objc/runtime.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //GLStudent *stu = [[GLStudent alloc] init];
        //[stu run];
        
        BOOL ret1 = [[NSObject class] isKindOfClass:[NSObject class]]; //YES
        BOOL ret2 = [[NSObject class] isMemberOfClass:[NSObject class]]; //NO
        BOOL ret3 = [[GLPerson class] isKindOfClass:[GLPerson class]]; //NO
        BOOL ret4 = [[GLPerson class] isMemberOfClass:[GLPerson class]]; //NO
    }
    return 0;
}
