//
//  SemaphoreDemo.m
//  锁
//
//  Created by mac on 2021/8/18.
//

#import "SemaphoreDemo.h"

@interface SemaphoreDemo()

@property (strong,nonatomic) dispatch_semaphore_t ticketSemaphore;
@property (strong,nonatomic) dispatch_semaphore_t moenySemaphote;
@end

@implementation SemaphoreDemo

- (instancetype)init
{
    self = [super init];
    if (self) {
        //最多允许一条线程并发
        self.ticketSemaphore = dispatch_semaphore_create(1);
        self.moenySemaphote = dispatch_semaphore_create(1);
    }
    return self;
}

- (void)__saveMoney {
    //判断moenySemaphote信号量是否大于0，
    //如果 <= 0,当前线程就会进入休眠等待（直到信号量的>0）
    //如果 >1, 就减1，然后往下执行后面的代码。
    dispatch_semaphore_wait(self.moenySemaphote, DISPATCH_TIME_FOREVER);
    
    [super __saveMoney];
    //让信号量的值 +1
    dispatch_semaphore_signal(self.moenySemaphote);
}
- (void)__drawMoney {
    dispatch_semaphore_wait(self.moenySemaphote, DISPATCH_TIME_FOREVER);
    [super __drawMoney];
    dispatch_semaphore_signal(self.moenySemaphote);
}

- (void)__saleTicket {
    dispatch_semaphore_wait(self.ticketSemaphore, DISPATCH_TIME_FOREVER);
    [super __saleTicket];
    dispatch_semaphore_signal(self.ticketSemaphore);
}

@end
