//
//  ViewController.m
//  03-tagged pointer
//
//  Created by mac on 2021/8/23.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,copy) NSString *name;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    NSLog(@"---begin");
    
    for (int i = 0; i < 10000; i++) {
        dispatch_async(queue, ^{
            self.name = [NSString stringWithFormat:@"abc"];
        });
    }
    
    NSLog(@"---end");

    NSString *str1 = [NSString stringWithFormat:@"abc"];
    NSString *str2 = [NSString stringWithFormat:@"abcdefghijk"];
    NSLog(@"\n[str1 class]=%@\n[str2 class]=%@",[str1 class],[str2 class]);
}

//- (void)setName:(NSString *)name {
//    if (_name != name) {
//        //旧值先释放
//        [_name realease];
//        //新值赋值。
//        //_name用copy修饰
//        _name = [name copy];
//        //_name用strong修饰
//        //_name = [name retain];
//    }
//}

//- (void)setName:(NSString *)name {
//    NSLog(@"%p",name);
//    _name = name;
//}


@end
