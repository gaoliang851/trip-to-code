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
        
        /*
        __block int age = 10;
        
        GLBlock glBlock = ^(void) {
            age = 20;
            NSLog(@"age is %d",age);//age is 20
        };
        glBlock();
        NSLog(@"real age is %d",age);//real age is 20
        */
        /*
        GLPerson *person = [[GLPerson alloc] init];
        person.age = 20;
        person.name = @"Java";
        
        GLBlock glBlock = ^(void) {
            person = [[GLPerson alloc] init];
            person.age = 25;
            person.name = @"C++"
        };
        glBlock();
        
        NSLog(@"%@",person);
        */
    }
    return 0;
}

void _main() {
    __block int age = 10;
    GLBlock glBlock = ^(void) {
        age = 20;
    };
    glBlock();
    NSLog(@"%d",age); //20
}

struct __Block_byref_age_0 {
    void *__isa;
    __Block_byref_age_0 *__forwarding;
    int __flags;
    int __size;
    int age;
};

struct __main_block_impl_0 {
    struct __block_impl impl;
    struct _block_desc* Desc;
    //被__block包装的对象
    __Block_byref_age_0 *age;
};

static struct _block_desc {
    size_t reserved;
    size_t Block_size;
    void (*copy)(void *,void *);
    void (*dispose)(void *);
}


void __main() {
    
    _Block_byref_age_0 age = {0,&age, 0,
        sizeof(__Block_byref_age_0), //size
        10 //age的赋值
    };
    
    GLBlock glBlock = &__main_block_impl_0(
                                           __main_block_func_0,
                                           &__main_block_desc_0_DATA,
                                           &age,
                                           570425344
                                           );
    glBlock();
    NSLog(@"%d",age); //20
}
