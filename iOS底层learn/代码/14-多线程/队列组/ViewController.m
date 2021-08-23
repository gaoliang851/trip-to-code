//
//  ViewController.m
//  队列组
//
//  Created by mac on 2021/8/12.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __block NSInteger number = 0;
    
    dispatch_group_t group = dispatch_group_create();
    
    //A耗时操作
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(3);
        number += 2222;
    });
    
    //B网络请求
    dispatch_group_enter(group);
    [self sendRequestWithCompletion:^(id response) {
        number += [response integerValue];
        dispatch_group_leave(group);
    }];
    
    //C网络请求
    dispatch_group_enter(group);
    [self sendRequestWithCompletion:^(id response) {
        number += [response integerValue];
        dispatch_group_leave(group);
    }];
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"%zd", number);
    });
}

- (void)sendRequestWithCompletion:(void (^)(id response))completion {
    //模拟一个网络请求
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        sleep(2);
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion) completion(@1111);
        });
    });
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_queue_create("my_queue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_group_async(group, queue, ^{
        for (int i = 0; i < 5;i++ ) {
            NSLog(@"任务1 ---- %@",[NSThread currentThread]);
        }
    });
    
    dispatch_group_async(group, queue, ^{
        for (int i = 0; i < 5;i++ ) {
            NSLog(@"任务2 ---- %@",[NSThread currentThread]);
        }
    });
    
    
    dispatch_group_async(group, queue, ^{
        for (int i = 0; i < 5;i++ ) {
            NSLog(@"任务3 ---- %@",[NSThread currentThread]);
        }
    });
    
    dispatch_group_notify(group, queue, ^{
        for (int i = 0; i < 5;i++ ) {
            NSLog(@"任务4 ---- %@",[NSThread currentThread]);
        }
    });
    
    dispatch_group_notify(group, queue, ^{
        for (int i = 0; i < 5;i++ ) {
            NSLog(@"任务5 ---- %@",[NSThread currentThread]);
        }
    });
    
    dispatch_group_async(group, queue, ^{
        for (int i = 0; i < 5;i++) {
            NSLog(@"任务6 ---- %@",[NSThread currentThread]);
        }
    });
}


@end
