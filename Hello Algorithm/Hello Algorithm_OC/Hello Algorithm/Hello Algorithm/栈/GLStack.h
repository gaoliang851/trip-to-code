//
//  GLStack.h
//  Hello Algorithm
//
//  Created by mac on 2021/9/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GLStack <E> : NSObject
/// 获取栈内元素数量
- (int)size;
/// 判断栈是否为空
- (BOOL)isEmpty;
/// 入栈
/// @param element element
- (void)push:(E)element;
/// 出栈
- (E)pop;
/// 获取栈顶元素
- (E)top;
/// 清空栈
- (void)clear;

@end

NS_ASSUME_NONNULL_END
