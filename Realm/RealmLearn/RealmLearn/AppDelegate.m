//
//  AppDelegate.m
//  RealmLearn
//
//  Created by mac on 2020/7/24.
//  Copyright © 2020 Dever.G. All rights reserved.
//

#import "AppDelegate.h"
#import <Realm/Realm.h>
#import "Person.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    // 设置新的架构版本。这个版本号必须高于之前所用的版本号
    uint64_t newVersion = 1;
    config.schemaVersion = newVersion;
    config.migrationBlock = ^(RLMMigration * _Nonnull migration, uint64_t oldSchemaVersion) {
      //迁移要做的工作
        if (newVersion > oldSchemaVersion) {
//            [migration enumerateObjects:NSStringFromClass(Person.class) block:^(RLMObject * _Nullable oldObject, RLMObject * _Nullable newObject) {
//                newObject[@"fullName"] = [NSString stringWithFormat:@"%@%@",oldObject[@"firstName"],oldObject[@"lastName"]];
//            }];
            
            [migration renamePropertyForClass:Person.className oldName:@"oldProperty" newName:@"newProperty"];
        }
    };
    [RLMRealmConfiguration setDefaultConfiguration:config];
////    // 打开文件之后将会自动执行迁移
//    [RLMRealm defaultRealm];
    
    [self setData];
    
    return YES;
}

- (void) setData {
    RLMRealm *realm = [RLMRealm defaultRealm];
    Person *p = [[Person alloc] init];

    p.age = 21;
    
    p.fullName = @"fullName";
//    p.lastName = @"lastName";
//    p.firstName = @"firstName";

    [realm transactionWithBlock:^{
        [realm addObject:p];
    }];

    NSLog(@"%@",[Person allObjects]);
    
}


@end
