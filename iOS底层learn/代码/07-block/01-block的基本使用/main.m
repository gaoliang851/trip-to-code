//
//  main.m
//  01-block的基本使用
//
//  Created by mac on 2021/3/14.
//

#import <Foundation/Foundation.h>
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 这样就是一个block，但是这个block不会执行
        ^{
            NSLog(@"This is a block");
        };
        
        //在后面添加(),就可以执行
        ^{
            NSLog(@"This is an another block");
        }(); // This is an another block
        
        //也可以使用变量保存起来
        void (^block)(NSString *) = ^(NSString *tag){
            NSLog(@"This is other block ~~,%@",tag);
        };
        block(@"abc");//This is other block ~~,abc
    }
    return 0;
}
