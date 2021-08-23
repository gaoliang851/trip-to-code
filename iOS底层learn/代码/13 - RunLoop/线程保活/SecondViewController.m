//
//  SecondViewController.m
//  线程保活
//
//  Created by mac on 2021/8/2.
//

#import "SecondViewController.h"
#import "GLThread.h"

@interface SecondViewController ()
@property (strong,nonatomic) GLThread *thread;
@property (nonatomic,assign,getter=isStop) BOOL stop;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    __weak typeof(self) weakSelf = self;
    self.thread = [[GLThread alloc] initWithBlock:^{
        NSLog(@"-----begin: %@",[NSThread currentThread]);
        
        // 往RunLoop里面添加Source\Timer\Observer
        [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
        while (weakSelf && !weakSelf.isStop) {
            [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        }
        
        NSLog(@"-----end: %@",[NSThread currentThread]);
    }];
    [self.thread start];
    
    UIButton *stopButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [stopButton setTitle:@"停止" forState:UIControlStateNormal];
    stopButton.frame = CGRectMake(0, 0, 100, 100);
    [self.view addSubview:stopButton];
    stopButton.center = self.view.center;
    [stopButton addTarget:self action:@selector(stopAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) stopAction:(id)sender {
    NSLog(@"%s",__func__);
    [self performSelector:@selector(stop)
                 onThread:self.thread
               withObject:nil
            waitUntilDone:NO];
}
- (void) stop {
    NSLog(@"%s",__func__);
    self.stop = YES;
    CFRunLoopStop(CFRunLoopGetCurrent());
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self performSelector:@selector(test) onThread:self.thread withObject:nil waitUntilDone:YES];
}

- (void)test {
    NSLog(@"%s %@", __func__, [NSThread currentThread]);
}


- (void)dealloc {
    [self stopAction:nil];
    NSLog(@"SecondViewController dealloc");
}

@end
