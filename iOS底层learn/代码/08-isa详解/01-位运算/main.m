//
//  main.m
//  01-位运算
//
//  Created by mac on 2021/4/20.
//

#import <Foundation/Foundation.h>
#import "GLPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int a = 0x1;
        int b = 0x0;
        
        
        char c = 0x1;
        NSLog(@"%d",a&b);
        NSLog(@"%d",a&a);
        NSLog(@"%d",a|b);
        NSLog(@"%d",b|b);
        
        NSLog(@"~~%d", 0b1001 << 3);
    }
    return 0;
}
