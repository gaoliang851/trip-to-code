//
//  main.m
//  Category的load方法
//
//  Created by mac on 2021/1/20.
//

#import <Foundation/Foundation.h>
#import "NSNumber+ABC.h"


@interface TestA : NSObject
- (void) test;
@end
@implementation TestA
+ (void)load {
    NSLog(@"%s",__func__);
}

- (void) test {
    NSLog(@"%s",__func__);
}

@end

@interface TestB : NSObject
@end
@implementation TestB
+ (void)load {
    NSLog(@"%s",__func__);
}
@end


@interface TestA (ddd)
@end
@implementation TestA (ddd)
+ (void)load {
    NSLog(@"%s",__func__);
}

- (void) test {
    NSLog(@"%s",__func__);
}

@end


@interface TestA (abc)
@end
@implementation TestA (abc)
+ (void)load {
    NSLog(@"%s",__func__);
}

- (void) test {
    NSLog(@"%s",__func__);
}

@end


@interface TestBKind : TestB
@end
@implementation TestBKind
+ (void)load {
    NSLog(@"%s",__func__);
}
@end



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TestA *a = [[TestA alloc] init];
        [a test];
        
       // NSNumber *n = @1;
        //[n setTest];
    }
    return 0;
}
