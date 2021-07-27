//
//  main.m
//  12 - Runtime常用API
//
//  Created by mac on 2021/7/13.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSString *data = @"iv321100fadfadsfa";
        NSLog(@"%@",[data substringFromIndex:8]);
    }
    return 0;
}
