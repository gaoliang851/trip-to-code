//
//  main.m
//  08-block的copy操作
//
//  Created by mac on 2021/3/15.
//

#import <Foundation/Foundation.h>

typedef void(^TestBlock)(void);
TestBlock aFunction() {
    int age = 10;
    return ^() {
        NSLog(@"the age is %d",age);
    };
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int age = 10;
        
        NSLog(@"%@",[aFunction() class]); //__NSMallocBlock__
        
        //没有赋值给__strong指针
        NSLog(@"%@",[^(void){
            NSLog(@"age is %d",age);
        } class]); //__NSStackBlock__
        
        //赋值给__strong指针
        TestBlock testBlock = ^(void){
            NSLog(@"age is %d",age);
        };
        NSLog(@"%@",[testBlock class]);//__NSMallocBlock__
        
        
        //usingBlock
        NSArray *array = @[];
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    
        }];
        
        //GCD
        dispatch_async(dispatch_get_main_queue(), ^{
            
        });
    }
    return 0;
}
