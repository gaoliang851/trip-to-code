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
    NSLog(@"%@ -- dealloc",self.name);
}

- (NSString *)description {
    return self.name;
}

- (BOOL)isEqual:(id)other
{
    if ([other isMemberOfClass:[self class]]) {
        Person *otherPerson = other;
        if ([otherPerson.name isEqualToString:self.name]) {
            return YES;
        }
    }
    return NO;
}



@end
