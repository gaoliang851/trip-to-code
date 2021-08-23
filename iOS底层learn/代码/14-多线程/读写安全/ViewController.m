//
//  ViewController.m
//  读写安全
//
//  Created by mac on 2021/8/18.
//

#import "ViewController.h"
#import <pthread.h>

@interface ViewController ()
@property (assign,nonatomic) pthread_rwlock_t rwLock;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    pthread_rwlock_init(&_rwLock, NULL);

    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    for (int i = 0; i < 100; i++) {
        dispatch_async(queue, ^{
            [self read];
            [self read];
            [self read];
        });
        dispatch_async(queue, ^{
            [self write];
        });
    }
}

- (void) read {
    pthread_rwlock_rdlock(&_rwLock);
    NSLog(@"== read");
    pthread_rwlock_unlock(&_rwLock);
}

- (void) write {
    pthread_rwlock_wrlock(&_rwLock);
    sleep(1);
    NSLog(@"== write");
    pthread_rwlock_unlock(&_rwLock);
}

- (void)dealloc
{
    pthread_rwlock_destroy(&_rwLock);
}


@end
