//
//  main.m
//  11-__block的内存管理
//
//  Created by mac on 2021/4/2.
//

#import <Foundation/Foundation.h>
#import "GLPerson.h"

typedef void(^GLBlock)(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        __block __unsafe_unretained GLPerson *person = [[GLPerson alloc] init];
        person.age = 10;
        
        GLBlock block = ^(void) {
            NSLog(@"%d",person.age);
        };
        
        block();
        
        NSLog(@"-------");
    }
    
    
    return 0;
}

void _main() {
    __block __unsafe_unretained
    GLPerson *person = [[GLPerson alloc] init];
    person.age = 10;
    GLBlock block = ^(void) {
        NSLog(@"%d",person.age);
    };
    block();
}

struct __Block_byref_person_0 {
    void *__isa;
    __Block_byref_person_0 *__forwarding;
    int __flags;
    int __size;
    GLPerson *__unsafe_unretained person;
};
