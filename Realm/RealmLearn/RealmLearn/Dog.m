//
//  Dog.m
//  RealmLearn
//
//  Created by mac on 2020/8/20.
//Copyright © 2020 Dever.G. All rights reserved.
//

#import "Dog.h"

@implementation Dog
+(NSString *)primaryKey {
    return @"name";
}

//+ (NSDictionary<NSString *,RLMPropertyDescriptor *> *)linkingObjectsProperties {
//    return @{
//        @"master":[RLMPropertyDescriptor descriptorWithClass:NSClassFromString(@"Person") propertyName:@"pets"]
//    };
//}

// Specify default values for properties

//+ (NSDictionary *)defaultPropertyValues
//{
//    return @{};
//}

// Specify properties to ignore (Realm won't persist these)

//+ (NSArray *)ignoredProperties
//{
//    return @[];
//}

@end
