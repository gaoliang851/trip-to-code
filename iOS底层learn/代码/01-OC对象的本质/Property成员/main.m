//
//  main.m
//  Property成员
//
//  Created by mac on 2020/12/22.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    @public
    int _age;
}
@property (nonatomic,assign) int height;
@end
@implementation Person
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
