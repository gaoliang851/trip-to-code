//
//  MutexDemo.m
//  锁
//
//  Created by mac on 2021/8/16.
//

#import "MutexDemo.h"
#import <pthread.h>

@interface MutexDemo()
@property (nonatomic,assign) pthread_mutex_t ticketsLock;
@property (nonatomic,assign) pthread_mutex_t moneyLock;
@end

@implementation MutexDemo

- (instancetype)init
{
    self = [super init];
    if (self) {
        // 初始化属性
        pthread_mutexattr_t attr;
        pthread_mutexattr_init(&attr);
        pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_NORMAL);
        /**
         * Mutex type attributes
         * #define PTHREAD_MUTEX_NORMAL        0
         * #define PTHREAD_MUTEX_ERRORCHECK    1
         * #define PTHREAD_MUTEX_RECURSIVE        2
         * #define PTHREAD_MUTEX_DEFAULT        PTHREAD_MUTEX_NORMAL
         */
        
        // 初始化锁
        pthread_mutex_init(&_ticketsLock, &attr);
        
        pthread_mutex_init(&_moneyLock, &attr);
        
        //销毁锁属性
        pthread_mutexattr_destroy(&attr);
        
    
        
    }
    return self;
}

- (void)__saleTicket {
    pthread_mutex_lock(&_ticketsLock);
    [super __saleTicket];
    pthread_mutex_unlock(&_ticketsLock);
}

-(void)__saveMoney {
    pthread_mutex_lock(&_moneyLock);
    [super __saveMoney];
    pthread_mutex_unlock(&_moneyLock);
}

-(void)__drawMoney {
    pthread_mutex_lock(&_moneyLock);
    [super __drawMoney];
    pthread_mutex_unlock(&_moneyLock);
}

- (void)otherTest {
    
}

- (void)dealloc {
    pthread_mutex_destroy(&_ticketsLock);
    pthread_mutex_destroy(&_moneyLock);
}

@end
