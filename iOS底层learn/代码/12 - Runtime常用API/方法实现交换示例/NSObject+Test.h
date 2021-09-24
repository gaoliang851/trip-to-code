//
//  NSObject+Test.h
//  方法实现交换示例
//
//  Created by mac on 2021/9/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Test)

/**
 * 判断类(或实例对象)是否实现了某个方法
 * 本质上都是调用 lookUpImpOrNil()，判断返回值是否为空
 */
- (BOOL)respondsToSelector:(SEL)aSelector;
+ (BOOL)instancesRespondToSelector:(SEL)aSelector;

/**
 * 检查类(或实例对象)是否实现了指定协议类的方法;
 * 本质上都是从当前cls循环获取superClass
 * 依次遍历class中的class_rw_t中的protocols数组。
 * 遍历protocols数组与 aProtocol比较。
 * 如果有协议与aProtocol名字相同 或着 遵守aProtocol，则返回true
 * 反之，返回false
 */
- (BOOL)conformsToProtocol:(Protocol *)aProtocol;
+ (BOOL)conformsToProtocol:(Protocol *)protocol;

@end

NS_ASSUME_NONNULL_END
