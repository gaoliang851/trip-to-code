//
//  main.m
//  06-关联对象
//
//  Created by mac on 2021/2/1.
//

#import <Foundation/Foundation.h>
#import "NSObject+Tag.h"
#import "WeakObj.h"
#import "WeakAssociateObjWrapper.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSObject *obj = [[NSObject alloc] init];
        obj.tag = @"abc";
        NSLog(@"%@",obj.tag);//abc
        
        WeakAssociateObjWrapper *weakobj = [[WeakAssociateObjWrapper alloc] init];
        weakobj.obj = [[WeakObj alloc] init];
        obj.obj = weakobj;
        
        while (true) {
            NSLog(@"--");
        }
    }
    return 0;
}
