//
//  NSObject+SSS.m
//  Category的load方法
//
//  Created by gaoliang on 2021/12/9.
//

#import "NSObject+SSS.h"

@implementation NSObject (SSS)
+ (void)load {
    NSLog(@"%s",__func__);
}

@end
