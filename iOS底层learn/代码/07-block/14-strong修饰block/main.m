//
//  main.m
//  14-strong修饰block
//
//  Created by gaoliang on 2022/3/1.
//

#import <Foundation/Foundation.h>

typedef void(^GLBlock)(void);


@interface Person : NSObject
@property (strong,nonatomic)GLBlock block;
- (void) test;
@end
@implementation Person
- (void)test {
    int a = 20;
    GLBlock block = ^{
        int c = a * 2;
        NSLog(@"c = %d",c);
    };
    NSLog(@"%@",block);
    self.block  = block;
    NSLog(@"%@",self.block);
}
@end


int main(int argc, const char * argv[]) {
    Person *p = [[Person alloc] init];
    @autoreleasepool {
//        int a = 20;
//        GLBlock block = ^{
//            int c = a * 2;
//            NSLog(@"c = %d",c);
//        };
//        p.block = block;
        [p test];
    }
    NSLog(@"%@",p.block);
    p.block();
    
#if __has_feature(objc_arc)
    NSLog(@"ARC");
#else
    NSLog(@"MRC");
# endif
    return 0;
}
