//
//  ViewController.m
//  01-定时器
//
//  Created by mac on 2021/8/21.
//

#import "ViewController.h"
#import "GLProxy.h"
#import "GLProxys.h"
#import "GLTimer.h"

@interface ViewController ()
@property (weak,nonatomic) NSTimer *timer;
//@property (strong,nonatomic) CADisplayLink *link;
//@property (strong,nonatomic) dispatch_source_t timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.f
//                                                      target:self
//                                                    selector:@selector(timerTest)
//                                                    userInfo:nil
//                                                     repeats:YES];
//
//    self.timer = timer;
//
//    NSLog(@"-----begin");
    
    NSString *s = [NSString stringWithFormat:@"a"];
//    NSLog(@"%@",s.class);
    
    [s hasPrefix:@"dfajdfkljasdfjlaksdf"];
    
//    NSTimer *timer;
    
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.f
//                                                  target:[GLProxy proxyWithTarget:self]
//                                                selector:@selector(timerTest)
//                                                userInfo:nil
//                                                 repeats:YES];
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.f
//                                                  target:[GLProxys proxyWithTarget:self]
//                                                selector:@selector(timerTest)
//                                                userInfo:nil
//                                                 repeats:YES];
    
//    self.link = [CADisplayLink displayLinkWithTarget:[GLProxys proxyWithTarget:self]
//                                            selector:@selector(timerTest)];
//    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
//    NSLog(@"---begin");
    
//    dispatch_queue_t queue = dispatch_queue_create("myQueue", DISPATCH_QUEUE_SERIAL);
    
    //创建一个定时器
    /**
     * 第一个参数 type:dispatch源可处理的事件类型
     * 第二个参数 handle: 可以理解为句柄、索引或id，假如要监听进程，需要传入进程的ID,一般填0
     * 第三个参数 mask：可以理解为描述，提供更详细的描述，让它知道具体要监听什么，一般填0
     * 第四个参数 queue：自定义源需要的一个队列，用来处理所有的响应句柄（block）
     */
//    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    
//    NSTimeInterval after = 2.0f;
//    NSTimeInterval interval = 1.f;
    //设置时间
    /**
     * 第一个参数 timer:要设置的定时器
     * 第二个参数 start:是几秒后开始执行
     * 第三个参数 interval: 是时间间隔
     * 第四个参数 leeway: 指的是一个期望的容忍时间。
     */
//    dispatch_source_set_timer(timer,
//                              dispatch_time(DISPATCH_TIME_NOW, after * NSEC_PER_SEC),
//                              interval * NSEC_PER_SEC,
//                              0);
    
    //设置回调
//    dispatch_source_set_event_handler(timer, ^{
//        NSLog(@"++");
//    });
    
//    dispatch_source_set_event_handler_f(timer, gcdTimerTest);
    
    // 启动定时器
//    dispatch_resume(timer);
    
//    self.timer = timer;

    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    dispatch_suspend(self.timer);
//    dispatch_source_cancel(self.timer);
//    self.timer = nil;
}

void gcdTimerTest(void *obj) {
    NSLog(@"++");
}

- (void) timerTest {
    NSLog(@"%s",__func__);
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.timer invalidate];
}

- (void)dealloc {
    NSLog(@"%s",__func__);
//    [self.timer invalidate];
//    [self.link invalidate];
}

@end


