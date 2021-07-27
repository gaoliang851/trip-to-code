//
//  main.m
//  03-isa
//
//  Created by mac on 2020/12/29.
//

#import <Foundation/Foundation.h>

/// MARK: 在NSObject中添加实例方法 test
@interface NSObject (Test)
- (void) test;
@end
@implementation NSObject (Test)
- (void)test {
    NSLog(@"-[NSObject test] %p",self);
}
@end


@interface Person : NSObject
+ (void) test;
@end
@implementation Person
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSLog(@"%p",[Person class]);//0x100008148
        [Person test]; //-[NSObject test] 0x100008148
        
    }
    return 0;
}
