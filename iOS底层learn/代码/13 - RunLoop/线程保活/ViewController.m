//
//  ViewController.m
//  线程保活
//
//  Created by mac on 2021/8/2.
//

#import "ViewController.h"
#import "GLThread.h"
#import "SecondViewController.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}






- (IBAction)pushAction:(id)sender {
    [self.navigationController pushViewController:[[SecondViewController alloc] init] animated:YES];
}


struct __CFRunLoopObserver {
        CFRuntimeBase _base;
        pthread_mutex_t _lock;
        CFRunLoopRef _runLoop;     /* 监听的RunLoop */
        CFIndex _rlCount;
        CFOptionFlags _activities; /* 监听的RunLoop状态 */
        CFIndex _order;   /* 创建时传入的排序 */
        CFRunLoopObserverCallBack _callout;    /* 回调 */
        CFRunLoopObserverContext _context;    /* 回调参数 */
};




@end
