//
//  5.m
//  RealmLearnTests
//
//  Created by mac on 2020/8/29.
//  Copyright © 2020 Dever.G. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NoticeModel.h"
#import <Realm/Realm.h>
@interface Notice : XCTestCase
@property (strong,nonatomic) RLMNotificationToken *token;
@end

@implementation Notice

- (void)setUp {
//    RLMRealm *realm = [RLMRealm defaultRealm];
    
//    __weak typeof(self) weakSelf = self;
//    RLMNotificationToken *token = [realm addNotificationBlock:^(RLMNotification  _Nonnull notification, RLMRealm * _Nonnull realm) {
//        NSLog(@"%@",notification);
////        [weakSelf.token invalidate];
//    }];
    //必须强持有token，否则token释放后就通知就收不到了
//    self.token = token;
  
    
    RLMResults *results = [NoticeModel allObjects];
//    self.token = [results addNotificationBlock:^(RLMResults * _Nullable results, RLMCollectionChange * _Nullable change, NSError * _Nullable error) {
//        NSLog(@"change:%@",change);
//    }];
    
    self.token = [results addNotificationBlock:^(RLMResults * _Nullable results, RLMCollectionChange * _Nullable change, NSError * _Nullable error) {
        NSLog(@"change:%@",change);
        NSLog(@"thread:%@",[NSThread currentThread]);
    } queue:dispatch_get_global_queue(0, 0)];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class
}

- (void)testExample {
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:[[NoticeModel alloc] init]];
    }];
    
    sleep(2);
    
    [realm transactionWithBlock:^{
        [realm addObject:[[NoticeModel alloc] init]];
    }];
}


@end
