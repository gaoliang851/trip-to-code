//
//  GLPerson.m
//  KVO
//
//  Created by mac on 2021/1/4.
//

#import "GLPerson.h"

@implementation GLPerson

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"abc");
    }
    return self;
}

//- (void) setAge: (int) age {
//    NSLog(@"%s",__func__);
//}
//- (void) _setAge: (int) age {
//    NSLog(@"%s",__func__);
//}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"set %@ forKey:%@",value,key);
}

+ (BOOL)accessInstanceVariablesDirectly {
    return NO;
}


@end
