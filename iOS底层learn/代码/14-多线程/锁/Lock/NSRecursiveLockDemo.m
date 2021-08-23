//
//  NSRecursiveLock.m
//  锁
//
//  Created by mac on 2021/8/17.
//

#import "NSRecursiveLockDemo.h"
@interface NSRecursiveLockDemo()
@property (strong,nonatomic) NSRecursiveLock *lock;
@end
@implementation NSRecursiveLockDemo

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.lock = [[NSRecursiveLock alloc] init];
    }
    return self;
}

- (void)otherTest {
    [self.lock lock];
    NSLog(@"%s",__func__);
    [self otherTest];
    [self.lock unlock];
}
@end
