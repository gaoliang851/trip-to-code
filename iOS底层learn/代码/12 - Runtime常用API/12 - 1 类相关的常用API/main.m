//
//  main.m
//  12 - 1 类相关的常用API
//
//  Created by mac on 2021/7/13.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface GLPerson : NSObject
- (void)run;
@end
@implementation GLPerson
- (void)run {
    NSLog(@"Person is runing");
}
@end

@interface GLStudent : NSObject
@end
@implementation GLStudent
@end

@interface GLCar : NSObject
- (void)run;
@end
@implementation GLCar
- (void)run {
    NSLog(@"Car is running");
}
@end

void printInfo(id self,SEL _cmd) {
    NSLog(@"my name is %@, and I am %@ years old",
          [self valueForKey:@"name"],
          [self valueForKey:@"age"]
          );
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        /// 创建一个类
        
        /**
         * 创建一对类，会将这个类以及这个的元类创建出来
         * 第一个参数：[NSObject class]，指定父类
         * 第二个参数：类名，C语言字符串
         * 第三个参数：额外的存储空间，通常为0
         */
        Class GLDogCls = objc_allocateClassPair([NSObject class], "GLDog", 0);
        
        /// 添加成员变量
        /// class_addIvar方法只能在 objc_allocateClassPair 之后和 objc_registerClassPair之前调用
        /// Ivar在底层类结构中，存储在class_ro_t中，是只读的。
        /// 新注册的类(objc_allocateClassPair)，还没有存储到class_ro_t中，
        /// objc_registerClassPair 注册之后，class_ro_t数据成形，就不可添加了。
        /**
         * 添加一个 int 类型的 age 变量
         * 第一个参数：要添加成员变量的类，不能是元类字符串
         * 第二个参数：成员变量的名称，C语言字符串
         * 第三个参数：成员变量的大小
         * 第四个参数：alignment 内存对齐，通常使用 log2(sizeof(point-type)
         */
        BOOL isSuccessAddForAge = class_addIvar(GLDogCls, "_age", sizeof(int), log2(sizeof(int)), @encode(int));
        
        BOOL isSuccessAddForName = class_addIvar(GLDogCls, "_name", sizeof(NSString *), log2(sizeof(NSString *)), @encode(NSString *));
        
        NSLog(@"%d,%d",isSuccessAddForAge,isSuccessAddForName);// 1,1
        
        //添加方法
        class_addMethod(GLDogCls, @selector(printInfo), (IMP)printInfo, "v@:");
        
        //注册类
        objc_registerClassPair(GLDogCls);
        
        /// 创建实例，以及属性赋值
        id dogInstance = [[GLDogCls alloc] init];
        [dogInstance setValue:@2 forKey:@"age"];
        [dogInstance setValue:@"Luck" forKey:@"name"];
        
        //调用方法
        [dogInstance performSelector:@selector(printInfo)];//my name is Luck, and I am 2 years old
        
        /// 当某个类确定不再使用时，可以使用 objc_disposeClassPair 释放该类
        objc_disposeClassPair(GLDogCls);
        
    }
    return 0;
}

void example_object_isClass() {
    // 判断[GLCar class]是否是类对象
    NSLog(@"object_isClass:%d",object_isClass([GLCar class]));
    
    // 判断 object_getClass([GLCar class]) 是否是元类
    NSLog(@"class_isMetaClass:%d",class_isMetaClass(object_getClass([GLCar class])));
}


void example_object_setClass() {
    GLPerson *person = [[GLPerson alloc] init];
    [person run]; //Person is runing
    
    object_setClass(person, [GLCar class]);
    [person run]; //Car is running
}


void example_object_getClass() {
    /**
     object_getClass(id obj);其本质是获取isa指针所指向的数据
     */
    GLStudent *stu = [[GLStudent alloc] init];
    Class cls = object_getClass(stu); //获取的是 GLStudent
    Class metaCls = object_getClass(cls); //获取的是GLStudent的元类
    
    NSLog(@"%p %p %p",cls,[GLStudent class],metaCls);
}
