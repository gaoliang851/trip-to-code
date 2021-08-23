//
//  NSConditionLockDemo.m
//  锁
//
//  Created by mac on 2021/8/18.
//

#import "NSConditionLockDemo.h"

@interface NSConditionLockDemo()
@property (strong,nonatomic) NSConditionLock *conditionLock;
@end

@implementation NSConditionLockDemo

- (instancetype)init
{
    self = [super init];
    if (self) {
        ///初始化锁，并设定锁的初始condition为1
        self.conditionLock = [[NSConditionLock alloc] initWithCondition:1];
        
        /// 如果使用init初始化，相当于 initWithCondition:0
        /// self.conditionLock = [[NSConditionLock alloc] init];
    }
    return self;
}

- (void)otherTest {
    [[[NSThread alloc] initWithTarget:self selector:@selector(__removeObject) object:nil] start];
    [[[NSThread alloc] initWithTarget:self selector:@selector(__addObject) object:nil] start];
}

- (void) __removeObject {
    ///当锁的condition == 2时解锁，否则就等待。
    [self.conditionLock lockWhenCondition:2];
    NSLog(@"__remove");
    ///解锁，并设置锁的condition = 3
    [self.conditionLock unlockWithCondition:3];
}

- (void) __addObject {
    ///当锁的condition == 1时解锁，否则就等待。
    [self.conditionLock lockWhenCondition:1];
    NSLog(@"__add");
    sleep(2);
    ///解锁，并设置锁的condition = 2
    [self.conditionLock unlockWithCondition:2];
}

@end
