//
//  MutexDemo2.m
//  锁
//
//  Created by mac on 2021/8/16.
//

#import "MutexDemo2.h"
#import <pthread.h>

@interface MutexDemo2()
@property (nonatomic,assign) pthread_mutex_t mutex;
@end

@implementation MutexDemo2

- (instancetype)init
{
    self = [super init];
    if (self) {
        // 初始化属性
        pthread_mutexattr_t attr;
        pthread_mutexattr_init(&attr);
        pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
        /**
         * Mutex type attributes
         * #define PTHREAD_MUTEX_NORMAL        0
         * #define PTHREAD_MUTEX_ERRORCHECK    1
         * #define PTHREAD_MUTEX_RECURSIVE        2
         * #define PTHREAD_MUTEX_DEFAULT        PTHREAD_MUTEX_NORMAL
         */
        
        // 初始化锁
        pthread_mutex_init(&_mutex, &attr);
        
        
        //销毁锁属性
        pthread_mutexattr_destroy(&attr);
    }
    return self;
}


- (void) otherTest {
    pthread_mutex_lock(&_mutex);
    NSLog(@"%s",__func__);
    [self otherTest];
    pthread_mutex_unlock(&_mutex);
}
@end
