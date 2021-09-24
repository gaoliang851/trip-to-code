//
//  main.m
//  MacTest
//
//  Created by mac on 2021/9/8.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@end
@implementation Person

@property (nonatomic,copy) NSString *name;

- (void)setName:(NSString *)name {
    if (_name != name) {
        //旧值释放
        [_name release];
        //新值赋值
        _name = [name copy];
    }
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
