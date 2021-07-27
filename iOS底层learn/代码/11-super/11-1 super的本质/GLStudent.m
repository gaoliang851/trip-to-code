//
//  GLStudent.m
//  11-1 super的本质
//
//  Created by mac on 2021/7/11.
//

#import "GLStudent.h"

@implementation GLStudent

- (void)run {
    [super run];
    NSLog(@"GLStudent run");
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"[self class] = %@",[self class]); //GLStudent
        NSLog(@"[self superclass] = %@",[self superclass]); //GLPerson

        NSLog(@"[super class] = %@",[super class]); //GLStudent
        NSLog(@"[super superclass] = %@",[super superclass]); //GLPerson
    }
    return self;
}

@end
