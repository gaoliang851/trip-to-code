//
//  ViewController.m
//  13 - RunLoop
//
//  Created by mac on 2021/7/27.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

/// 回调函数
/// @param observer observer
/// @param activity Loop activity
/// @param info 创建observer时，传入的context
void observerCallBack(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info) {
    switch (activity) {
        case kCFRunLoopEntry:
            NSLog(@"kCFRunLoopEntry,即将进入Loop");
            break;
        case kCFRunLoopBeforeTimers:
            NSLog(@"kCFRunLoopBeforeTimers,即将处理Timer");
            break;
        case kCFRunLoopBeforeSources:
            NSLog(@"kCFRunLoopBeforeSources,即将处理Source");
            break;
        case kCFRunLoopBeforeWaiting:
            NSLog(@"kCFRunLoopBeforeWaiting,即将进入Loop");
            break;
        case kCFRunLoopAfterWaiting:
            NSLog(@"kCFRunLoopAfterWaiting,刚从睡眠中唤醒");
            break;
        case kCFRunLoopExit:
            NSLog(@"kCFRunLoopExit,即将退出Loop");
            break;
            
        default:
            break;
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    CFRunLoopObserverGetActivities(<#CFRunLoopObserverRef observer#>)
    
    CFRunLoopObserverInvalidate(<#CFRunLoopObserverRef observer#>);
    
}

- (void) test1 {
    /// 1. 创建observer
    
    // 第一个参数：分配存储空间,使用默认的即可：kCFAllocatorDefault
    // 第二个参数：要监听的状态（kCFRunLoopAllActivities）所有的状态
    // 第三个参数：是否持续监听
    // 第四个参数：优先级,填0即可
    // 第五个参数：回调,CFRunLoopObserverCallBack类型,
    // typedef void (*CFRunLoopObserverCallBack)(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info);
    // 第六个参数：context,回调传参，可以NULL
    CFRunLoopObserverRef observerRef = CFRunLoopObserverCreate(kCFAllocatorDefault,
                                                               kCFRunLoopAllActivities,
                                                               YES,
                                                               0,
                                                               observerCallBack,
                                                               NULL);
    
    /// 2.将observer添加到RunLoop中,
    // kCFRunLoopCommonModes默认包括kCFRunLoopDeaultMode、UITrackingRunLoopMode
    CFRunLoopAddObserver(CFRunLoopGetMain(),
                         observerRef,
                         kCFRunLoopCommonModes);
    
    /// 3. 释放observer
    CFRelease(observerRef);
}

- (void) test2 {
    /// 1. 创建observer
    // 第一个参数：分配存储空间,使用默认的即可：kCFAllocatorDefault
    // 第二个参数：要监听的状态（kCFRunLoopAllActivities）所有的状态
    // 第三个参数：是否持续监听
    // 第四个参数：优先级,填0即可
    // 第五个参数：block回调
    CFRunLoopObserverRef observerRef = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault,
                                                                          kCFRunLoopAllActivities,
                                                                          YES,
                                                                          0,
                                                                          ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        switch (activity) {
            case kCFRunLoopEntry:
                NSLog(@"kCFRunLoopEntry,即将进入Loop");
                break;
            case kCFRunLoopBeforeTimers:
                NSLog(@"kCFRunLoopBeforeTimers,即将处理Timer");
                break;
            case kCFRunLoopBeforeSources:
                NSLog(@"kCFRunLoopBeforeSources,即将处理Source");
                break;
            case kCFRunLoopBeforeWaiting:
                NSLog(@"kCFRunLoopBeforeWaiting,即将进入Loop");
                break;
            case kCFRunLoopAfterWaiting:
                NSLog(@"kCFRunLoopAfterWaiting,刚从睡眠中唤醒");
                break;
            case kCFRunLoopExit:
                NSLog(@"kCFRunLoopExit,即将退出Loop");
                break;
                
            default:
                break;
        }
    });
    
    /// 2.将observer添加到RunLoop中,
    // kCFRunLoopCommonModes默认包括kCFRunLoopDeaultMode、UITrackingRunLoopMode
    CFRunLoopAddObserver(CFRunLoopGetMain(),
                         observerRef,
                         kCFRunLoopCommonModes);
    
    /// 3. 释放observer
    CFRelease(observerRef);
}





@end
