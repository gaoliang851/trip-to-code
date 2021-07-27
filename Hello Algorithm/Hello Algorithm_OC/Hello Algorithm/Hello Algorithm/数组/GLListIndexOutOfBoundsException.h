//
//  GLArrayIndexOutOfBoundsException.h
//  Hello Algorithm
//
//  Created by mac on 2021/4/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GLListIndexOutOfBoundsException : NSException
+ (instancetype) exeptionWithIndex:(int)index;
@end

NS_ASSUME_NONNULL_END
