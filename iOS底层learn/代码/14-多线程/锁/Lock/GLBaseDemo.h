//
//  GLBaseDemo.h
//  锁
//
//  Created by mac on 2021/8/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GLBaseDemo : NSObject
- (void)moneyTest;
- (void)ticketTest;
- (void) otherTest;

#pragma mark - 暴露给子类去使用
- (void)__saveMoney;
- (void)__drawMoney;
- (void)__saleTicket;


@end

NS_ASSUME_NONNULL_END
