//
//  main.m
//  KVO
//
//  Created by mac on 2021/1/4.
//

#import <Foundation/Foundation.h>
#import "GLPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        GLPerson *person = [[GLPerson alloc] init];
        [person setValue:@10 forKey:@"age"];
        
        NSLog(@"---");
    }
    return 0;
}
