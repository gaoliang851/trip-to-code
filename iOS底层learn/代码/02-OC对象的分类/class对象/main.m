//
//  main.m
//  class对象
//
//  Created by mac on 2020/12/25.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSObject *obj1 = [[NSObject alloc] init];
        Class obj_class = [obj1 class];
        Class obj_class2 = [NSObject class];
        Class obj_class3 = object_getClass(obj1);
        NSLog(@"%p %p %p",obj_class,obj_class2,obj_class3);//相同
        
        
    }
    return 0;
}
