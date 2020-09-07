
//
//  2.m
//  RealmLearnTests
//
//  Created by mac on 2020/8/20.
//  Copyright © 2020 Dever.G. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Realm/Realm.h>
#import "Student.h"
@interface SupportType : XCTestCase

@end

@implementation SupportType

- (void) testSaveImage {
//    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    Student *stu = [[Student alloc] init];
    stu.age = 2;
    stu.name = @"小王";
//    stu.headImage = [UIImage imageNamed:@"abc"];
    UIImage *image = [UIImage imageNamed:@"abc"];
    stu.imageData = UIImagePNGRepresentation(image);
    
    [realm transactionWithBlock:^{
        [realm addOrUpdateObject:stu];
    }];
    
    NSLog(@"%@",[Student allObjects]);
}

@end
