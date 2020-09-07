//
//  4.m
//  RealmLearnTests
//
//  Created by mac on 2020/8/27.
//  Copyright © 2020 Dever.G. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Realm/Realm.h>
#import "Cat.h"
@interface Properties : XCTestCase

@end

@implementation Properties
- (void)testExample {
    Cat *cat = [[Cat alloc] init];
    cat.c = nil;
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    [realm transactionWithBlock:^{
        [realm addObject:cat];
    }];
    
    NSLog(@"%@",[Cat allObjects]);
}



@end
