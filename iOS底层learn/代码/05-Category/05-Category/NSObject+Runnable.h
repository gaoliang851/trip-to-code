//
//  NSObject+Runnable.h
//  05-Category
//
//  Created by mac on 2021/1/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Runnable)
@property (nonatomic,assign) int count;
@property (nonatomic,assign,class) BOOL isRun;

- (void) start;

+ (void) currentObj;

@end

NS_ASSUME_NONNULL_END
