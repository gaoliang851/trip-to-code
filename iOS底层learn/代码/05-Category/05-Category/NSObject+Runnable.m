//
//  NSObject+Runnable.m
//  05-Category
//
//  Created by mac on 2021/1/10.
//

#import "NSObject+Runnable.h"

@implementation NSObject (Runnable)

- (void) start {
    NSLog(@"NSObject start");
}

+ (void) currentObj {
    NSLog(@"currentObj");
}
@end
