//
//  main.m
//  09-对象类型的auto变量
//
//  Created by mac on 2021/3/27.
//

#import <Foundation/Foundation.h>
#import "GLPerson.h"

typedef void(^Block)(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Block block;
        {
            GLPerson *p = [[GLPerson alloc] init];
            p.age = 10;
            __weak typeof(p) weakP = p;
            block = ^(void) {
                NSLog(@"-----%d",weakP.age);
            };
        }
        //这该语句执行之前，p就释放了
        NSLog(@"------------");
    }
    return 0;
}


/// MRC下，栈上的block 类型是 __NSStackBlock__,
/// 这种类型的block并不会对访问的变量进行捕获（强引用）
/// 如果想要变量捕获（强引用）需要调用copy方法
/// ARC下，会对栈上的block自动进行copy操作，
/// 使其变为__NSMallocBlock,
/// 该类型的block会对对象类型的Auto变量捕获。
void test01(void){
    Block block;
    {
        GLPerson *p = [[GLPerson alloc] init];
        p.age = 10;
        block = [^(void) {
            NSLog(@"---------%d",p.age);
        } copy];
    }
}

