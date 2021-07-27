//
//  main.m
//  01-OC对象的本质
//
//  Created by mac on 2020/12/16.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>

struct NSObject_IMPL {
    Class isa;
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSObject *obj = [[NSObject alloc] init];
    
        // >> 8,获取实例对象内存对齐后的内存大小
        NSLog(@"%zd", class_getInstanceSize([NSObject class]));
        // >> 16,获取指针指向内存的大小
        NSLog(@"%zd", malloc_size((__bridge const void *)obj));
    }
    return 0;
}
