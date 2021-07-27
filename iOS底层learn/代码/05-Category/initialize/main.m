//
//  main.m
//  initialize
//
//  Created by mac on 2021/1/22.
//

#import <Foundation/Foundation.h>
#import "SuperObject.h"
#import "SubObject1.h"
#import "SubObject2.h"
#import <objc/runtime.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //输出：
        //SuperObject (Start) initialize
        //SuperObject (Start) initialize
        
        // 因为：调用子类的+initialize 方法之前 调用了 父类的+initialize
        // 而SuperObject的分类中实现了+initialize（最后编译的是SuperObject (Start)）
        // 又因为 SubObject1 没有实现,所以调用了父类的+initialize，即[SuperObject(Start) initialize]
        // 所以调用了两次 [SuperObject(Start) initialize]
        [SubObject1 alloc];
        //输出：
        //因为SubObject2没有实现,所以调用了父类的+initialize，即[SuperObject(Start) initialize]
        [SubObject2 alloc];
    }
    return 0;
}
