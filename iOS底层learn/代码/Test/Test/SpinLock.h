//
//  SpinLock.h
//  Test
//
//  Created by mac on 2021/9/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SpinLock : NSObject <NSLocking>
- (void)lock;
- (void)unlock;
@end

NS_ASSUME_NONNULL_END
