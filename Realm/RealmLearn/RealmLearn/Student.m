//
//  Student.m
//  RealmLearn
//
//  Created by mac on 2020/7/29.
//Copyright © 2020 Dever.G. All rights reserved.
//

#import "Student.h"

@implementation Student

// Specify default values for properties

//+ (NSDictionary *)defaultPropertyValues
//{
//    return @{};
//}

// Specify properties to ignore (Realm won't persist these)

//+ (NSArray *)ignoredProperties
//{
//    return @[@"headImage"];
//}

+ (NSString *)primaryKey {
    return @"age";
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@[age:%d,name:%@,image:%@]",[self class],self.age,self.name,self.headImage];
}

- (UIImage *)headImage {
    return [UIImage imageWithData:self.imageData];
}

@end
