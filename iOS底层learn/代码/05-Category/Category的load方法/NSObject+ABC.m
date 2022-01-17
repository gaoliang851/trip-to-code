//
//  NSObject+ABC.m
//  Category的load方法
//
//  Created by gaoliang on 2021/12/9.
//

#import "NSObject+ABC.h"

@implementation NSObject (ABC)

+ (void)load {
    NSLog(@"%s",__func__);
}

@end
