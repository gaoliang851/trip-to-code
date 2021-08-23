//
//  OSUnFairLockDemo.m
//  锁
//
//  Created by mac on 2021/8/16.
//

#import "OSUnFairLockDemo.h"
@interface OSUnFairLockDemo()
@property (nonatomic,assign) os_unfair_lock moenyLock;
@property (nonatomic,assign) os_unfair_lock ticketsLock;
@end

@implementation OSUnFairLockDemo

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.moenyLock = OS_UNFAIR_LOCK_INIT;
        self.ticketsLock = OS_UNFAIR_LOCK_INIT;
    }
    return self;
}

- (void)__saleTicket {
    os_unfair_lock_lock(&_ticketsLock);
    [super __saleTicket];
    os_unfair_lock_unlock(&_ticketsLock);
}

- (void)__saveMoney {
    os_unfair_lock_lock(&_moenyLock);
    [super __saveMoney];
    os_unfair_lock_unlock(&_moenyLock);
}

- (void)__drawMoney {
    os_unfair_lock_lock(&_moenyLock);
    [super __drawMoney];
    os_unfair_lock_unlock(&_moenyLock);
}

@end
