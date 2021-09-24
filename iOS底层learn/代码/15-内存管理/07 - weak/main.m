//
//  main.m
//  07 - weak
//
//  Created by mac on 2021/8/28.
//

#import <Foundation/Foundation.h>
#import "GLPerson.h"
#import <objc/objc.h>

void test() {
    __unsafe_unretained GLPerson *person3;
    NSLog(@"----begin");
    {
        GLPerson *person = [[GLPerson alloc] init];
        person3 = person;
    }
    NSLog(@"----end");
    
    NSLog(@"%@",person3);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //__strong GLPerson *person1;
        //__weak GLPerson *person2;
        test();
    }
    return 0;
}
