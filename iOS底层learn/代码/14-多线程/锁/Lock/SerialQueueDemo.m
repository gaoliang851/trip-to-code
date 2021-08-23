//
//  SerialQueueDemo.m
//  锁
//
//  Created by mac on 2021/8/18.
//

#import "SerialQueueDemo.h"

@interface SerialQueueDemo()
@property (strong,nonatomic) dispatch_queue_t ticketQueue;
@property (strong,nonatomic) dispatch_queue_t moneyQueue;
@end

@implementation SerialQueueDemo
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.ticketQueue = dispatch_queue_create("ticketQueue", DISPATCH_QUEUE_SERIAL);
        self.moneyQueue = dispatch_queue_create("moneyQueue", DISPATCH_QUEUE_SERIAL);
//        NSArray *array = [NSArray array];
//        [array objectAtIndex:2];
    }
    return self;
}

- (void)__saleTicket {
    dispatch_sync(self.ticketQueue, ^{
        [super __saleTicket];
    });
}

- (void)__drawMoney {
    dispatch_sync(self.moneyQueue, ^{
        [super __drawMoney];
    });
}

- (void)__saveMoney {
    dispatch_sync(self.moneyQueue, ^{
        [super __saveMoney];
    });
}


@end
