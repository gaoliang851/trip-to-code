//
//  GLProxys.h
//  01-定时器
//
//  Created by mac on 2021/8/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GLProxys : NSProxy
@property (nonatomic,weak) id target;
+ (instancetype) proxyWithTarget:(id)target;
@end

NS_ASSUME_NONNULL_END
