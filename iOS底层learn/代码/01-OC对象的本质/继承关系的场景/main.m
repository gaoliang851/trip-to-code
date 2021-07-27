//
//  main.m
//  继承关系的场景
//
//  Created by mac on 2020/12/22.
//

#import <Foundation/Foundation.h>
#import <malloc/malloc.h>
#import <objc/runtime.h>

@interface Person : NSObject
{
    @public
    int _age;
}
@end
@implementation Person
@end

@interface Student : Person
{
    @public
    int _no;
}
@end
@implementation Student
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Person *p = [[Person alloc] init];
        // >>16
        NSLog(@"Person:%zd",class_getInstanceSize([Person class]));
        // >>16
        NSLog(@"p:%zd",malloc_size((__bridge  const void *)p));
        
        Student *stu = [[Student alloc] init];
        // >>16
        NSLog(@"Student:%zd",class_getInstanceSize([Student class]));
        // >>16
        NSLog(@"stu:%zd",malloc_size((__bridge  const void *)stu));
    }
    return 0;
}
