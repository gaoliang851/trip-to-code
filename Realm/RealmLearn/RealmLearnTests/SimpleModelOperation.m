//
//  SimpleModelOperation.m
//  RealmLearnTests
//
//  Created by mac on 2020/7/29.
//  Copyright © 2020 Dever.G. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Realm/Realm.h>
#import "Student.h"
@interface SimpleModelOperation : XCTestCase

@end

@implementation SimpleModelOperation

- (void)testSaveModel {
        //通过字典来创建
//    Student *stu = [[Student alloc] initWithValue:@{@"age":@12,@"name":@"小王"}];
    
    //通过数组来创建
//    Student *stu = [[Student alloc] initWithValue:@[@12,@"小王"]];
//    Student *stu = [[Student alloc] init];
//    stu.age = 12;
//    stu.name = @"小王";

    RLMRealm *realm = [RLMRealm defaultRealm];//获取数据库实例

//    [realm beginWriteTransaction];//开启写入事务
//
//    [realm addObject:stu];//添加模型对象
//
//    [realm commitWriteTransaction];//提交写入事务

    [realm transactionWithBlock:^{
        [Student createInRealm:realm withValue:@{@"age":@12,@"name":@"小王"}];
    }];
}



/// 更新对象模型
- (void)testUpdateModel {
    //第三种 根据主键进行更新
    RLMRealm *realm = [RLMRealm defaultRealm];
//    Student *stu = [[Student alloc] initWithValue:@{@"age":@14,@"name":@"小鸡儿"}];

    [realm transactionWithBlock:^{
        [Student createOrUpdateInRealm:realm withValue:@[@14,@"大鸡儿"]];
    }];
    
    RLMResults *result =  [Student allObjects];
    
    for (int i = 0; i < result.count; i++) {
        NSLog(@"%@",[result objectAtIndex:i]);
    }
}

- (void) update1 {
    //第一种在事务中直接更新对象
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    Student *stu = [[Student alloc] initWithValue:@{@"age":@12,@"name":@"小王"}];
    
    [realm transactionWithBlock:^{
        [realm addObject:stu];
    }];
    
    RLMResults *result =  [Student allObjects];
    
    for (int i = 0; i < result.count; i++) {
        NSLog(@"%@",[result objectAtIndex:i]);
    }
    
    NSLog(@"---------------------");
    
    [realm transactionWithBlock:^{
        stu.age = 14;
    }];
    
    RLMResults *result2 =  [Student allObjects];
    
    for (int i = 0; i < result.count; i++) {
        NSLog(@"%@",[result2 objectAtIndex:i]);
    }
}

- (void) update2 {
    //第二种 根据主键进行更新
    RLMRealm *realm = [RLMRealm defaultRealm];
    Student *stu = [[Student alloc] initWithValue:@{@"age":@14,@"name":@"小鸡儿"}];

    [realm transactionWithBlock:^{
        [realm addOrUpdateObject:stu];
    }];
    
    RLMResults *result =  [Student allObjects];
    
    for (int i = 0; i < result.count; i++) {
        NSLog(@"%@",[result objectAtIndex:i]);
    }
}

- (void) testDeleteModel {
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    [realm transactionWithBlock:^{
        for (int i = 0; i < 15; i++) {
            [Student createOrUpdateInRealm:realm withValue:@[@(i),[NSString stringWithFormat:@"name:%d",i]]];
        }
    }];
    
    RLMResults *result =  [Student allObjects];
    
    for (int i = 0; i < result.count; i++) {
        NSLog(@"%@",[result objectAtIndex:i]);
    }
    
    NSLog(@"------");
    
    [realm transactionWithBlock:^{
        [realm deleteAllObjects];
    }];
    
    
    RLMResults *temp =  [Student allObjects];
    
    for (int i = 0; i < temp.count; i++) {
        NSLog(@"%@",[temp objectAtIndex:i]);
    }
    
}

- (void) delete1 {
    // 场景, 根据主键删除一个模型
    RLMRealm *realm = [RLMRealm defaultRealm];
    Student *stu = [Student objectForPrimaryKey:@12];
    
    [realm transactionWithBlock:^{
        [realm deleteObject:stu];
    }];
    
    RLMResults *result =  [Student allObjects];
    
    for (int i = 0; i < result.count; i++) {
        NSLog(@"%@",[result objectAtIndex:i]);
    }
}

- (void) delete2 {
    // 场景,是删除某一特定类型的所有模型
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    [realm transactionWithBlock:^{
        for (int i = 0; i < 15; i++) {
            [Student createOrUpdateInRealm:realm withValue:@[@(i),[NSString stringWithFormat:@"name:%d",i]]];
        }
    }];
    
    RLMResults *result =  [Student allObjects];
    
    for (int i = 0; i < result.count; i++) {
        NSLog(@"%@",[result objectAtIndex:i]);
    }
    
    NSLog(@"------");
    /**
     使用 RLMRealm.defaultRealm 查询,如果要使用具体的数据库实例可以使用
     RLMResults *results = [Student allObjectsInRealm:realm];
     */
    RLMResults *results = [Student allObjects];
    
    [realm transactionWithBlock:^{
        for (Student *stu in results) {
            [realm deleteObject:stu];
        }
    }];
    
    RLMResults *temp =  [Student allObjects];
    
    for (int i = 0; i < temp.count; i++) {
        NSLog(@"%@",[temp objectAtIndex:i]);
    }
}

- (void) testQuery {
    
    RLMRealm *defaultDb = [RLMRealm defaultRealm];
    
    //查询所有数据
//  RLMResults *allStus = [Student allObjects];
    //查询所有数据
//    RLMResults *allStus = [Student objectsInRealm:defaultDb where:@"age > 13"];
    
    //根据主键获取对象实例
//    Student *stu = [Student  objectInRealm:defaultDb forPrimaryKey:@15];
    
    //排序
//    RLMResults *allStus = [Student allObjects];
    //根据某一个属性值 升序排序(Asceding:升序 Descending:降序)
//    RLMResults *sortStus = [allStus sortedResultsUsingKeyPath:@"age" ascending:YES];
    
    //多个条件同时排序
//    NSString *
    
//    [allStus sortedResultsUsingDescriptors:@[]];
    
    //链式查询(在查询结果的基础上, 进行二次查询)
    RLMResults *allStus = [Student allObjects];
    NSLog(@"allStus:%@",allStus);
    RLMResults *someStus =  [allStus objectsWhere:@"name beginswith '小'"];
    NSLog(@"someStus:%@",someStus);
    RLMResults *bigStus = [someStus objectsWhere:@"age > 13"];
    NSLog(@"bigStus:%@",bigStus);
}


@end
