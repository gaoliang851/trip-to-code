//
//  main.m
//  meta-class
//
//  Created by mac on 2020/12/28.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
//        Class cls = [NSObject class];
//        NSLog(@"%p",cls);//0x7fff93c6f118
//        Class metaClass = object_getClass([NSObject class]);
//        NSLog(@"%p",metaClass);//0x7fff93c6f0f0
//
//        //这种方式只能获取Class对象，获取不到metaClass对象
//        Class class = [[NSObject class] class];
//        NSLog(@"%p",class);//0x7fff93c6f118
//
//        NSLog(@"%d",class_isMetaClass(cls));//0
//        NSLog(@"%d",class_isMetaClass(metaClass)); //1
        
        
        NSObject *obj = [[NSObject alloc] init];
        //传入instance对象返回class对象
        Class cls = object_getClass(obj);
        NSLog(@"%d",class_isMetaClass(cls));//0
        //传入class对象返回meta-class对象
        Class metaCls = object_getClass(cls);
        NSLog(@"%d",class_isMetaClass(metaCls));//1
        
    }
    return 0;
}
