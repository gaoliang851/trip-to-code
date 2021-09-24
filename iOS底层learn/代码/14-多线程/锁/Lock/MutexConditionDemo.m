//
//  MutexConditionDemo.m
//  锁
//
//  Created by mac on 2021/8/16.
//

#import "MutexConditionDemo.h"
#import <pthread.h>

@interface MutexConditionDemo()
@property (nonatomic,assign) pthread_mutex_t mutex;
@property (nonatomic,assign) pthread_cond_t condition;
@property (strong,nonatomic) NSMutableArray *data;
@end

@implementation MutexConditionDemo

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.data = [NSMutableArray array];
        //初始化锁
        pthread_mutex_init(&_mutex, NULL);
        //初始化条件
        pthread_cond_init(&_condition, NULL);
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
    pthread_mutex_lock(&_mutex);
    [self.data addObject:[[NSObject alloc] init]];
    NSLog(@"添加了元素");
    //激活一个等待该条件的线程,并且
    pthread_cond_signal(&_condition);
    NSLog(@"cond_signal");
    pthread_mutex_unlock(&_mutex);
    NSLog(@"----add end");
}

- (void) __removeObject {
    
    pthread_mutex_lock(&_mutex);
    if (self.data.count == 0) {
        //等待条件_condition,并且释放锁_mutex
        //线程在这一句进行睡眠
        pthread_cond_wait(&_condition, &_mutex);
        NSLog(@"----wait end");
    }
    [self.data removeObjectAtIndex:0];
    NSLog(@"删除了元素");
    
    pthread_mutex_unlock(&_mutex);
    
}

- (void)dealloc {
    pthread_mutex_destroy(&_mutex);
    pthread_cond_destroy(&_condition);
}

@end
