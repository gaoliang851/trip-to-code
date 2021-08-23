//
//  ViewController.m
//  GCD
//
//  Created by mac on 2021/8/7.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_sync(queue, ^{
        for (int i = 0; i < 10; i++) {
            NSLog(@"任务1 - %@",[NSThread currentThread]);
        }
    });
    
    dispatch_sync(queue, ^{
        for (int i = 0; i < 10; i++) {
            NSLog(@"任务2 - %@",[NSThread currentThread]);
        }
    });

    dispatch_sync(queue, ^{
        for (int i = 0; i < 10; i++) {
            NSLog(@"任务3 - %@",[NSThread currentThread]);
        }
    });

}

@end
