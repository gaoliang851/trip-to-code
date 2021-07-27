//
//  ViewController.m
//  11-2 一道面试题
//
//  Created by mac on 2021/7/12.
//

#import "ViewController.h"
#import "GLPerson.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    id cls = [GLPerson class];
    void *obj = &cls;
    [(__bridge id)obj print]; //my name is <ViewController: 0x7f9d90e088a0>
}


@end
