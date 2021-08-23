//
//  ViewController.m
//  02-CADisplayLink
//
//  Created by mac on 2021/8/21.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong,nonatomic) CADisplayLink *link;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.link = [CADisplayLink displayLinkWithTarget:self selector:@selector(linkTest)];
    [self.link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void) linkTest {
    NSLog(@"%s",__func__);
}

@end
