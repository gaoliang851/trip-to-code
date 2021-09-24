//
//  main.m
//  01-定时器
//
//  Created by mac on 2021/8/21.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#include <stdlib.h>

int main(int argc, char * argv[]) {
    
//    id __unsafe_unretained obj1 = nil;
//    {
//        id  obj0 = [[NSMutableArray alloc]init];
//        [obj0 addObject:@"obj"];
//        obj1 = obj0;
//        NSLog(@"obj0 = %@", obj0);
//    }
//
//    NSLog(@"obj1 = %@", obj1);
    
    
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
