//
//  NSLockDemo.m
//  锁
//
//  Created by mac on 2021/8/17.
//

#import "NSLockDemo.h"

@interface NSLockDemo()
@property (strong,nonatomic) NSLock *ticketLock;
@end

@implementation NSLockDemo

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.ticketLock = [[NSLock alloc] init];
    }
    return self;
}

- (void)__saleTicket {
    [self.ticketLock lock];
    [super __saleTicket];
    [self.ticketLock unlock];
}


@end
