//
//  main.m
//  02-OC对象的本质
//
//  Created by mac on 2020/12/21.
//

#import <Foundation/Foundation.h>
#import <malloc/malloc.h>
#import <objc/runtime.h>

@interface Student : NSObject
{
    @public
    int _no;
    int _age;
    int _height;
}
@end
@implementation Student
@end

struct NSObject_IMPL {
    Class isa;
};

struct Student_IMPL {
    struct NSObject_IMPL NSObject_IVARS;
    int _no;
    int _age;
    int _height;
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Student *stu = [[Student alloc] init];
        stu->_no = 4;
        stu->_age = 5;
        stu->_height = 6;
//        stu->_score = 7;
        
        // >>32
        NSLog(@"%zd",malloc_size((__bridge const void *)stu));
        // >>24
        NSLog(@"%zd",class_getInstanceSize([Student class]));
        // >> 24
        NSLog(@"%zd",sizeof(struct Student_IMPL));
        
//        struct Student_IMPL *stu2 = (__bridge  struct Student_IMPL *)stu;
//        NSLog(@"%d,%d",stu2->_no,stu2->_age);//4,5
        NSLog(@"%p",NSClassFromString(@"Student"));
        NSLog(@"%p",objc_getClass("Student"));
    }
    return 0;
}
