//
//  main.m
//  02-OC对象的分类
//
//  Created by mac on 2020/12/25.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    @public
    int _age;
}
@end
@implementation Person
@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *p1 = [[Person alloc] init];
        p1->_age = 3;
        
        Person *p2 = [[Person alloc] init];
        p2->_age = 4;
        
    }
    return 0;
}
