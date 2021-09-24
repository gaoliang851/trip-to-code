//
//  ViewController.m
//  Test
//
//  Created by mac on 2021/9/13.
//

#import "ViewController.h"
#import <libkern/OSAtomic.h>
#import <os/lock.h>
#import <pthread.h>
@interface ViewController ()
@property (strong,nonatomic) dispatch_queue_t queue;
@property (strong,nonatomic) dispatch_group_t group;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self testBarrier];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_group_async(self.group, queue, ^{
        NSLog(@"other");
    });
}

- (void) test {
    dispatch_queue_t mySerialDispatchQueue = dispatch_queue_create("com.example.gcd", 0);
    dispatch_queue_t globalQueue = dispatch_get_global_queue(0, 0);
    // 将mySerialDispatchQueue 变更为和 globalQueue 相同
    dispatch_set_target_queue(mySerialDispatchQueue, globalQueue);
    
    
    //dispatch_after函数并不是在指定时间后处理执行，而是在指定时间后追加处理到 Dispatch Queue
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        
    });
}

- (void) testGroup {
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_queue_create("mdaf", DISPATCH_QUEUE_CONCURRENT);
    queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    //queue = dispatch_get_main_queue();
    //dispatch_set_target_queue(queue, dispatch_get_main_queue());
    dispatch_group_async(group, queue, ^{
        NSLog(@"blk1--%@",[NSThread currentThread]);
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"blk2--%@",[NSThread currentThread]);
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"blk3--%@",[NSThread currentThread]);
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"blk4--%@",[NSThread currentThread]);
    });
    
    dispatch_group_notify(group, queue, ^{
        NSLog(@"main--%@",[NSThread currentThread]);
    });
    sleep(2);
    dispatch_group_async(group, queue, ^{
        NSLog(@"blk5--%@",[NSThread currentThread]);
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"blk6--%@",[NSThread currentThread]);
    });
}

- (void) testGroup2 {
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_group_notify(group,dispatch_get_main_queue(),^{
        NSLog(@"notify 任务");
    });
    dispatch_group_enter(group);
    dispatch_async(queue, ^{
        NSLog(@"任务1");
        dispatch_group_leave(group);
    });
    dispatch_group_enter(group);
    dispatch_async(queue, ^{
        NSLog(@"任务2");
        dispatch_group_leave(group);
    });
    NSLog(@"主线程任务");
}

- (void) testBarrier {
    dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        NSLog(@"reading1");
    });
    dispatch_async(queue, ^{
        NSLog(@"reading2");
    });
    dispatch_async(queue, ^{
        NSLog(@"reading3");
    });
    dispatch_async(queue, ^{
        NSLog(@"reading4");
    });
    dispatch_barrier_async(queue, ^{
        NSLog(@"writing1");
        sleep(2);
        NSLog(@"end write1");
    });
//    dispatch_async(queue, ^{
//        sleep(2);
//        NSLog(@"writing1");
//        sleep(2);
//        NSLog(@"end write");
//    });
    dispatch_async(queue, ^{
        NSLog(@"reading5");
    });
    dispatch_async(queue, ^{
        NSLog(@"reading6");
    });
    dispatch_barrier_async(queue, ^{
        NSLog(@"writing2");
        sleep(2);
        NSLog(@"end write2");
    });
    dispatch_async(queue, ^{
        NSLog(@"reading7");
    });
    dispatch_async(queue, ^{
        NSLog(@"reading8");
    });
}

- (void) groupApi {
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_queue_create("myQueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_notify(group, queue, ^{
        NSLog(@"All is Done");
    });
    dispatch_group_async(group,queue,^{
        NSLog(@"commit task1");
    });
    
    dispatch_group_async(group,queue,^{
        NSLog(@"commit task2");
    });
}

- (void) testSemaphore {
    
    // 信号量的初始值
    int value = -1;
    // 初始化信号量
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(value);
    // 如果信号量的值<=0,当前线程就会进入休眠等待(直到信号量的值>0)
    // 如果信号量的值>0,就减1，然后往下执行后面的代码
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    // 让信号量的值加1
    dispatch_semaphore_signal(semaphore);
    
}

- (void) testOnce {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 只运行一次
    });
}

@end
