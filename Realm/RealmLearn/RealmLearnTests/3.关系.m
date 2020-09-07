//
//  3.m
//  RealmLearnTests
//
//  Created by mac on 2020/8/21.
//  Copyright © 2020 Dever.G. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Realm/Realm.h>
#import "Person.h"
#import "Dog.h"

@interface Relation : XCTestCase

@end

@implementation Relation
- (void)testExample {

    [self reversionRelationship];
}

- (void) reversionRelationship {
    Dog *pet1 = [[Dog alloc] init];
    pet1.age = 2;
    pet1.name = @"旺财";
    Dog *pet2 = [[Dog alloc] init];
    pet2.age = 2;
    pet2.name = @"旺财";
    Person *p = [[Person alloc] init];
    p.age = 10;
    p.name = @"小王";
    [p.pets addObject:pet1];
    [p.pets addObject:pet2];
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addOrUpdateObject:p];
    }];
    
    RLMResults *result = [Person allObjects];
    
    Person *pp = result.firstObject;
    
    NSLog(@"%@-%@",pp.pets.firstObject.master,pp.pets.firstObject.master.class);
    
//    RLMPropertyDescriptor
}

- (void) mulitRelation {
    Dog *pet1 = [[Dog alloc] initWithValue:@{@"age":@2,@"name":@"旺财"}];
    Dog *pet2 = [[Dog alloc] initWithValue:@{@"age":@2,@"name":@"大黄"}];
    Person *p = [[Person alloc] init];
    p.age = 10;
    p.name = @"小王";
    [p.pets addObject:pet1];
    [p.pets addObject:pet2];
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addOrUpdateObject:p];
    }];
    
    Person *pp = [Person allObjects].firstObject;
    
    
    
}

- (void) oneRelation {
    /**対一关系**/
        Person *p = [[Person alloc] init];
        p.age = 10;
        p.name = @"小王";
    //
        Dog *pet1 = [[Dog alloc] initWithValue:@{@"age":@2,@"name":@"旺财"}];
    //    pet1.age = 2;
    //    pet1.name = @"旺财";
    //
    //    p.pet = pet1;
    //
    //    RLMRealm *realm = [RLMRealm defaultRealm];
    //
    //    [realm transactionWithBlock:^{
    //        [realm addOrUpdateObject:p];
    //    }];
        
        
        NSLog(@"%@",[Person allObjects].firstObject);
}




@end
