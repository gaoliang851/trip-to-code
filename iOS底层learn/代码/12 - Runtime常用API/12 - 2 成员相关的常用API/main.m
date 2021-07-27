//
//  main.m
//  12 - 2 成员相关的常用API
//
//  Created by mac on 2021/7/19.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>


@interface GLPerson : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) int age;
@end
@implementation GLPerson
- (NSString *)name {
    return _name;
}

//- (void)setName:(NSString *)name {
//    _name = name;
//}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        /// 获取类中某个成员变量的信息
        Ivar nameIvar = class_getInstanceVariable([GLPerson class], "_name");
        Ivar ageIvar = class_getInstanceVariable([GLPerson class], "_age");
        NSLog(@"%s %s",ivar_getName(nameIvar),ivar_getTypeEncoding(nameIvar)); //_name @"NSString"
        NSLog(@"%s %s",ivar_getName(ageIvar),ivar_getTypeEncoding(ageIvar)); //_age i


        /// 设置和获取成员变量的值
        GLPerson *person =  [[GLPerson alloc] init];

        // 设置name的值，不走setter方法
        object_setIvar(person, nameIvar, @"小李");
        // 获取name的值，不走getter方法
        NSLog(@"%@",object_getIvar(person, nameIvar)); //小李
        
        // 设置age的值
        object_setIvar(person, ageIvar, (__bridge id)(void *)10);
        // 获取age的值
        void * ageValue = (__bridge void *)(object_getIvar(person, ageIvar));
        NSLog(@"%d", (int)ageValue);//10
        
//        /// 拷贝实例变量列表(最后需要调用free释放)
//        unsigned int ivarCount;
//        Ivar *ivarList = class_copyIvarList([GLPerson class], &ivarCount);
//
//        //遍历实例变量列表
//        for (int i = 0; i < ivarCount; i++) {
//            Ivar ivar = ivarList[i];
//            NSLog(@"%s %s",ivar_getName(ivar),ivar_getTypeEncoding(ivar));
//        }
//        free(ivarList);
    }
    return 0;
}


void test1() {
    
}
