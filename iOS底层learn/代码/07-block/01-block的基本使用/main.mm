//
//  main.m
//  01-block的基本使用
//
//  Created by mac on 2021/3/14.
//



#import <Foundation/Foundation.h>

@interface GLPerson : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) int age;
@end
@implementation GLPerson
-(NSString *)description {
    return [NSString stringWithFormat:@"%@(%d)",self.name,self.age];
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        // 这样就是一个block，但是这个block不会执行
//        ^{
//            NSLog(@"This is a block");
//        };
//
//        //在后面添加(),就可以执行
//        ^{
//            NSLog(@"This is an another block");
//        }(); // This is an another block
//
//        //也可以使用变量保存起来
//        void (^block)(NSString *) = ^(NSString *tag){
//            NSLog(@"This is other block ~~,%@",tag);
//        };
//        block(@"abc");//This is other block ~~,abc
        
        GLPerson *person = [[GLPerson alloc] init];
        person.name = @"jack";
        person.age = 18;
        
        void (^block)(GLPerson *) = ^(GLPerson *person){
            person.age = 20;
        };
        block(person);
        
        NSLog(@"%@",person);
        
    }
    return 0;
}


typedef void (^Block)(void);
void test1() {
    __block int age = 10;
    Block block = ^{
        age = 20;
    };
    block();
}

struct __block_impl {
    
};

struct __main_block_des_0 {
    
};

struct __Block_byref_person_0 {
    void *__isa;
    __Block_byref_person_0 *__forwarding;
    int __flags;
    int __size;
    //这里用什么修饰符，取决于person的修饰符
    //__block __weak => __weak
    GLPerson *__strong person;
    void (*__Block_byref_id_object_copy)(void*, void*);
    void (*__Block_byref_id_object_dispose)(void*);
};


// __Block修饰前
//struct __main_block_imp_0 {
//    struct __block_impl impl;
//    struct __main_block_des_0* Desc;
//    int age;
//};


struct __main_block_imp_0 {
    struct __block_impl impl;
    struct __main_block_des_0* Desc;
    struct __Block_byref_age_0 *age;
};
