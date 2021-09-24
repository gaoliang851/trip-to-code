//
//  NSTimer+Test.h
//  01-定时器
//
//  Created by mac on 2021/9/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (Test)

/**
 * "timer"开头的API，即创建一个普通的NSTimer,
 * 需要添加到RunLoop中
 */
+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)ti
                        invocation:(NSInvocation *)invocation
                           repeats:(BOOL)yesOrNo;

+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)ti
                            target:(id)aTarget
                          selector:(SEL)aSelector
                          userInfo:(id)userInfo
                           repeats:(BOOL)yesOrNo;

/**
 * "scheduledTimer"前缀的为自动启动NSTimer的
 * 会自动以NSDefaultRunLoopModeMode添加到当前线程RunLoop中，
 * 不添加到RunLoop中的NSTimer是无法正常工作的。
 */
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti
                                 invocation:(NSInvocation *)invocation
                                    repeats:(BOOL)yesOrNo;

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti
                                     target:(id)aTarget
                                   selector:(SEL)aSelector
                                   userInfo:(id)userInfo
                                    repeats:(BOOL)yesOrNo;

@end

NS_ASSUME_NONNULL_END
