//
//  ViewController1.m
//  13 - RunLoop
//
//  Created by mac on 2021/7/28.
//

#import "ViewController1.h"

@interface ViewController1()
@property (nonatomic,weak) NSTimer *timer1;
@property (nonatomic,weak) NSTimer *timer2;
@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    
    // timer1创建后会自动以NSDefaultRunLoopMode默认模式添加到当前RunLoop中，所以可以正常工作
    self.timer1 = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeInterval:) userInfo:nil repeats:YES];
    NSTimer *tempTimer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timeInterval:) userInfo:nil repeats:YES];
    // 如果不把timer2添加到RunLoop中是无法正常工作的(注意如果想要在滚动UIScrollView时timer2可以正常工作可以将NSDefaultRunLoopMode改为NSRunLoopCommonModes)
    [[NSRunLoop currentRunLoop] addTimer:tempTimer forMode:NSDefaultRunLoopMode];
    self.timer2 = tempTimer;
    
    
    CGRect rect = [UIScreen mainScreen].bounds;
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectInset(rect, 0, 200)];
    [self.view addSubview:scrollView];
    
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectInset(scrollView.bounds, -100, -100)];
    contentView.backgroundColor = [UIColor redColor];
    [scrollView addSubview:contentView];
    scrollView.contentSize = contentView.frame.size;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.timer1 invalidate];
    [self.timer2 invalidate];
    [self dismissViewControllerAnimated:true completion:nil];
}

- (void)dealloc {
    NSLog(@"ViewController1 dealloc...");
}

- (void)timeInterval:(NSTimer *)timer {
    if (self.timer1 == timer) {
        NSLog(@"timer1...");
    } else {
        NSLog(@"timer2...");
    }
}

@end

