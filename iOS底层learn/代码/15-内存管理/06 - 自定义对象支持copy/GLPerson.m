//
//  GLPerson.m
//  06 - 自定义对象支持copy
//
//  Created by mac on 2021/8/27.
//

#import "GLPerson.h"

@implementation GLPerson
-(id)copyWithZone:(NSZone *)zone {
    GLPerson *person = [[GLPerson alloc] init];
    person.age = self.age;
    person.weight = self.weight;
    return person;
}
@end
