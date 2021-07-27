//
//  GLArrayIndexOutOfBoundsException.m
//  Hello Algorithm
//
//  Created by mac on 2021/4/29.
//

#import "GLListIndexOutOfBoundsException.h"

static NSExceptionName const GL_ARRAY_LIST_EXCEPTION_OUT_OF_BOUNDS_NAME = @"ArrayIndexOutOfBoundsException";

@implementation GLListIndexOutOfBoundsException

+ (instancetype) exeptionWithIndex:(int)index {
    return [[self alloc] initWithName:GL_ARRAY_LIST_EXCEPTION_OUT_OF_BOUNDS_NAME reason:[NSString stringWithFormat:@"Array index out of range: %d",index] userInfo:nil];
}
@end
