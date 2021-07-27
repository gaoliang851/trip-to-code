//
//  main.m
//  09-class结构
//
//  Created by mac on 2021/6/1.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "MJClassInfo.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        
        
        //0x1d1834e41 0x1d1834e41 地址相同
        NSLog(@"%p %p",@selector(test),sel_registerName("test"));
        
        NSLog(@"%s", @encode(SEL));
        
        NSLog(@"%s", @encode(BOOL));
        
        mj_objc_class *cls = (__bridge mj_objc_class *)[AppDelegate class];
        class_rw_t *data = cls->data();
        self
        
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
