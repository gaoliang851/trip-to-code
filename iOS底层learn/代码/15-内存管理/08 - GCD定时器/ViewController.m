//
//  ViewController.m
//  08 - GCD定时器
//
//  Created by mac on 2021/9/8.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong,nonatomic) dispatch_source_t timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


@end


/// 创建定时器
/// @param type dispatch源可处理的事件类型
/// @param handle 可以理解为句柄、索引或id，假如要监听进程，需要传入进程的ID,一般填0
/// @param mask 可以理解为描述，提供更详细的描述，让它知道具体要监听什么，一般填0
/// @param queue 自定义源需要的一个队列，用来处理所有的响应句柄（block）
dispatch_source_t dispatch_source_create(dispatch_source_type_t type,
                                         uintptr_t handle,
                                         uintptr_t mask,
                                         dispatch_queue_t queue);


/// 设置定时器
/// @param source 要设置的定时器
/// @param start 是几秒后开始执行
/// @param interval 是时间间隔
/// @param leeway 指的是一个期望的容忍时间。
void dispatch_source_set_timer(dispatch_source_t source,
                               dispatch_time_t start,
                               uint64_t interval,
                               uint64_t leeway);



/// 设置回调（block方法）
/// @param source 要设置的时间源
/// @param handler 回调block
void dispatch_source_set_event_handler(dispatch_source_t source,
                                       dispatch_block_t handler);
/// 设置回调（C函数回调）
/// @param source 要设置的时间源
/// @param handler 回调的C语言函数
void dispatch_source_set_event_handler_f(dispatch_source_t source,
                                         dispatch_function_t handler);


/// 启动定时器
/// @param object 要启动的定时器
void dispatch_resume(dispatch_object_t object);

/// 停止定时器
/// @param object 要启动的定时器
void dispatch_suspend(dispatch_object_t object);
void dispatch_source_cancel(dispatch_source_t source);



