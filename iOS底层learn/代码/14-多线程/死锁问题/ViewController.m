//
//  ViewController.m
//  死锁问题
//
//  Created by mac on 2021/8/8.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    NSLog(@"执行任务1");
    dispatch_queue_t queue = dispatch_queue_create("myqueu", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{ // 0
        NSLog(@"执行任务2");
    dispatch_sync(queue, ^{ // 1
        NSLog(@"执行任务3");
    });
        NSLog(@"执行任务4");
    });
    NSLog(@"执行任务5");
}



//- (void) viewDidLoad {
//    [super viewDidLoad];
//    NSLog(@"任务1 ----");
//    dispatch_async(dispatch_get_main_queue(), ^{
//        NSLog(@"任务2 -----");
//    });
//    NSLog(@"任务3 -------");
//}

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//    NSLog(@"任务1 ----");
//    dispatch_sync(dispatch_get_main_queue(), ^{
//        NSLog(@"任务2 -----");
//    });
//    NSLog(@"任务3 -------");
//}


@end
