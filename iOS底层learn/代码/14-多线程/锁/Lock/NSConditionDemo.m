//
//  NSConditionLock.m
//  锁
//
//  Created by mac on 2021/8/17.
//

#import "NSConditionDemo.h"

@interface NSConditionDemo()
@property (strong,nonatomic) NSCondition *cond;
@property (strong,nonatomic) NSMutableArray *data;
@end

@implementation NSConditionDemo

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.cond = [[NSCondition alloc] init];
        self.data = [NSMutableArray array];
    }
    return self;
}

- (void)otherTest {
    //消费者线程
    [[[NSThread alloc] initWithTarget:self selector:@selector(__removeObject) object:nil] start];
    sleep(2);
    //生产者线程
    [[[NSThread alloc] initWithTarget:self selector:@selector(__addObject) object:nil] start];
}

- (void) __addObject {
    [self.cond lock];
    
    [self.data addObject:[[NSObject alloc] init]];
    NSLog(@"添加了元素");
    //激活一个等待该条件的线程,并且
    [self.cond signal];
    NSLog(@"cond_signal");
    [self.cond unlock];
    NSLog(@"----add end");
}

- (void) __removeObject {
    
    [self.cond lock];
    if (self.data.count == 0) {
        //等待条件_condition,并且释放锁_mutex
        //线程在这一句进行睡眠
        [self.cond wait];
        NSLog(@"----wait end");
    }
    [self.data removeObjectAtIndex:0];
    NSLog(@"删除了元素");
    
    [self.cond unlock];
    
}
@end
