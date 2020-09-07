//
//  Cat.m
//  RealmLearn
//
//  Created by mac on 2020/8/27.
//Copyright © 2020 Dever.G. All rights reserved.
//

#import "Cat.h"

@implementation Cat

// Specify default values for properties

+ (NSDictionary *)defaultPropertyValues
{
    return @{@"c":@"CValue"};
}

+ (NSArray<NSString *> *)requiredProperties {
    return @[@"a",@"c"];
}

// Specify properties to ignore (Realm won't persist these)

+ (NSArray *)ignoredProperties{
    return @[@"a"];
}

@end
