//
//  ViewController.m
//  锁
//
//  Created by mac on 2021/8/14.
//

#import "ViewController.h"
#import "GLBaseDemo.h"
#import "OSSpinLockDemo.h"
#import "OSUnFairLockDemo.h"
#import "MutexDemo.h"
#import "MutexDemo2.h"
#import "MutexConditionDemo.h"
#import "NSLockDemo.h"
#import "NSRecursiveLockDemo.h"
#import "NSConditionDemo.h"
#import "NSConditionLockDemo.h"
#import "SerialQueueDemo.h"
#import "SemaphoreDemo.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    GLBaseDemo *demo = [[SemaphoreDemo alloc] init];
//    [demo otherTest];
    [demo moneyTest];
//    [demo ticketTest];
}


@end
