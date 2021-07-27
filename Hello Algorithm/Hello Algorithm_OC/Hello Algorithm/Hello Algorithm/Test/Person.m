//
//  Person.m
//  Hello Algorithm
//
//  Created by mac on 2021/4/29.
//

#import "Person.h"

@implementation Person

+ (instancetype) personWithName:(NSString *)name {
    return [[self alloc] initWithName:name];
}

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        self.name = name;
    }
    return self;
}

- (void)dealloc {
    GLLog(@"%@ -- dealloc",self.name);
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Person(%@)",self.name];
}

- (BOOL)isEqual:(id)other
{
    if ([other isMemberOfClass:[self class]]) {
        Person *otherPerson = other;
        if ([otherPerson.name isEqual:self.name]) {
            return YES;
        }
    }
    return NO;
}



@end
