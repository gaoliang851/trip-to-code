//
//  ViewController.m
//  RealmLearn
//
//  Created by mac on 2020/7/24.
//  Copyright © 2020 Dever.G. All rights reserved.
//

#import "ViewController.h"
#import <Realm/Realm.h>
#import "NoticeModel.h"
@interface ViewController ()
@property (strong,nonatomic) RLMNotificationToken *token;
@property (strong,nonatomic) dispatch_queue_t queue;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
//    [self readonlySet];
    //初始化出一个默认Realm数据库。在 /Documents 目录下会创建四个文件
    /**
     default.realm
     default.realm.lock
     default.realm.management
     default.realm.note
     */
//    RLMRealm *realm = [RLMRealm defaultRealm];
    
    
//    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    
    //NSLog(@"%@",config.fileURL);//默认是 /Documents/default.realm
    
    //如果文件夹不存在也会报错
//    config.fileURL = [[[[[config.fileURL URLByDeletingLastPathComponent] URLByAppendingPathComponent:@"userName"]  URLByAppendingPathComponent:@"test"] URLByAppendingPathComponent:@"test"] URLByAppendingPathExtension:@"realm"];
//
//    NSError *error;
//    RLMRealm *realm = [RLMRealm realmWithConfiguration:config error:&error];
//    if (error) {
//        NSLog(@"%@",realm);
//    } else {
//        NSLog(@"success");
//    }
    
//    [self addNotice];
    
//    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES)lastObject];
//    NSString *dbFileUrl = [[documentPath stringByAppendingPathComponent:@"userName"] stringByAppendingPathExtension:@"realm"];
//    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
//    config.fileURL = [NSURL fileURLWithPath:dbFileUrl];
//    RLMRealm *realm = [RLMRealm realmWithConfiguration:config error:nil];
//    [realm transactionWithBlock:^{
//        [realm addObject:[NoticeModel new]];
//    }];
//
//    RLMRealm *realm = [RLMRealm realmWithURL:[NSURL fileURLWithPath:dbFileUrl]];
//    NSLog(@"%@",[NoticeModel allObjectsInRealm:realm]);
}

- (void) addNotice {
    RLMRealm *realm = [RLMRealm defaultRealm];
    RLMResults *result = [NoticeModel allObjects];
//    self.token = [realm addNotificationBlock:^(RLMNotification  _Nonnull notification, RLMRealm * _Nonnull realm) {
//        NSLog(@"%@",notification);
//    }];
    
    self.queue = dispatch_get_global_queue(0, 0);

    self.token = [result addNotificationBlock:^(RLMResults * _Nullable results, RLMCollectionChange * _Nullable change, NSError * _Nullable error) {
        if (change) {
            NSLog(@"%@-%@",[NSThread currentThread],change);
        }
    } queue:self.queue];
}

- (IBAction)addAction:(id)sender {
    NSLog(@"addd");
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:[[NoticeModel alloc] init]];
    }];
//    sleep(5);
    [realm transactionWithBlock:^{
        [realm addObject:[[NoticeModel alloc] init]];
    }];
}

- (void) readonlySet {
    
    NSNumber <RLMInt> *value = @1;
    if ([value conformsToProtocol:@protocol(RLMInt)]) {
        [value intValue];
    }
    
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"222" withExtension:@"realm"];
    
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    config.migrationBlock = ^(RLMMigration * _Nonnull migration, uint64_t oldSchemaVersion) {
        
    };
    config.fileURL = url;
    config.readOnly = YES;
    
    RLMRealm *realm = [RLMRealm realmWithConfiguration:config error:nil];
    
    [realm transactionWithBlock:^{
        [realm addObject:[NoticeModel new]];
    }];
    
    NSLog(@"%@",[NoticeModel allObjectsInRealm:realm]);
}


@end
