//
//  main.m
//  02-block的本质
//
//  Created by mac on 2021/3/14.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        void(^block)(int,int) = ^(int a,int b) {
            NSLog(@"Hello, World! - %d - %d",a,b);
        };
        
        block(10,20);
    }
    return 0;
}
 
extern struct __AtAutoreleasePool;

void test() {
    
    {
        void *atautoreleaseObj = AutoreleasePoolPage::push();
        //do somethings
        AutoreleasePoolPage::pop(atautoreleaseObj);
    }
}

