//
//  ViewController.m
//  16-autorelease
//
//  Created by mac on 2021/9/12.
//

#import "ViewController.h"
#import "GLPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSThread *thread = [[NSThread alloc] initWithBlock:^{
        GLPerson *person = [[GLPerson alloc] init];
    }];
    [thread start];
}


@end
