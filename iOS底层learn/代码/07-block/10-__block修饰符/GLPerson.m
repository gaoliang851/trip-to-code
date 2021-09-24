//
//  Person.m
//  09-对象类型的auto变量
//
//  Created by mac on 2021/3/27.
//

#import "GLPerson.h"

@implementation GLPerson

- (NSString *)description {
    return [NSString stringWithFormat:@"name is %@,age is %d",_name,_age];
}

- (void)dealloc
{
    NSLog(@"Person dealloc");
}
@end
