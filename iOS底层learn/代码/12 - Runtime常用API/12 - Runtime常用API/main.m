//
//  main.m
//  12 - Runtime常用API
//
//  Created by mac on 2021/7/13.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
@protocol GLProtocol
@required
- (void) testA;
@end

@interface GLPerson : NSObject <GLProtocol>
- (void) abc;
@end

@implementation GLPerson


@end


/************       类相关      ************/
///动态创建一个类（参数：父类，类名，额外的内存空间）
Class objc_allocateClassPair(Class superclass,
                             const char *name,
                             size_t extraBytes);

/// 注册一个类(要在类注册之前添加成员变量)
void objc_registerClassPair(Class cls);
/// 销毁一个类
void objc_disposeClassPair(Class cls);
/// 获取isa指向的Class
Class object_getClass(id obj);
///设置isa指向的Class
Class object_setClass(id obj,Class cls);
///判断一个OC对象是否为Class
BOOL object_isClass(Class cls);
///判断一个Class是否为元类
BOOL class_isMetaClass(Class cls);
///获取父类
Class class_getSuperclass(Class cls);


/************      成员变量      ************/
///获取一个实例变量信息
Ivar class_getInstanceVariable(Class cls,const char *name);
///拷贝实例变量列表（最后需要调用free释放）
Ivar *class_copyIvarList(Class cls,unsigned int *outCount);

///设置或获取成员变量的值
void object_setIvar(id obj,Ivar ivar, id value);
id object_getIvar(id obj,Ivar ivar);

///动态添加成员变量(已经注册的类是不能动态添加成员变量的)
BOOL class_addIvar(Class cls,
                   const char *name,
                   size_t size,
                   uint8 alignment,
                   const char *types);

///获取成员变量的相关信息
const char *ivar_getName(Ivar v);
const char *ivar_getTypeEncoding(Ivar v);


/************      属性      ************/
/// 获取一个属性
objc_property_t class_getProperty(Class cls,
                                  const char *name);
/// 拷贝属性列表（最后需要调用free释放）
objc_property_t *class_copyPropertyList(Class cls,
                                        unsigned int *outCount);
/// 动态添加属性
BOOL class_addProperty(Class cls,
                       const char *name,
                       const objc_property_attribute_t *attributes,
                       unsigned int attributeCount);

/// 动态替换属性
void class_replaceProperty(Class cls,
                           const char *name,
                           const objc_property_attribute_t *attributes,
                           unsigned int attributeCount);


/// 获取属性的一些信息
const char *property_getName(objc_property_t property);
const char *property_getAttributes(objc_property_t property);

/************      方法1      ************/
/// 获得一个实例方法、类方法
Method class_getInstanceMethod(Class cls, SEL name);
Method class_getClassMethod(Class cls, SEL name);
/// 方法实现相关操作
IMP class_getMethodImplementation(Class cls, SEL name);
IMP method_setImplementation(Method m, IMP imp);
void method_exchangeImplementations(Method m1, Method m2);
/// 拷贝方法列表（最后需要调用free释放）
Method *class_copyMethodList(Class cls, unsigned int *outCount);

/************      方法2      ************/
/// 动态添加方法
BOOL class_addMethod(Class cls,
                     SEL name,
                     IMP imp,
                     const char *types);
/// 动态替换方法
IMP class_replaceMethod(Class cls,
                        SEL name,
                        IMP imp,
                        const char *types);


/************      方法3      ************/
/// 获取方法的相关信息（带有copy的需要调用free去释放）
SEL method_getName(Method m);

IMP method_getImplementation(Method m);

const char *method_getTypeEncoding(Method m);

unsigned int method_getNumberOfArguments(Method m);

char *method_copyReturnType(Method m);

char *method_copyArgumentType(Method m,
                              unsigned int index);
/// 选择器相关
const char *sel_getName(SEL sel);

SEL sel_registerName(const char *str);

/// 用block作为方法实现
IMP imp_implementationWithBlock(id block);

id imp_getBlock(IMP anImp);

BOOL imp_removeBlock(IMP anImp);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        GLPerson *person = [[GLPerson alloc] init];
        BOOL result1 =  [person respondsToSelector:@selector(abc)];
        BOOL result2 =  [person conformsToProtocol:@protocol(GLProtocol)];
        NSLog(@"%d %d",result1,result2);
        
    }
    return 0;
}
