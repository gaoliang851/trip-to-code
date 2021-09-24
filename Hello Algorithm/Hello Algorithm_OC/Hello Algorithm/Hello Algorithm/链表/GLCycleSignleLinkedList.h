//
//  GLCycleSignleLinkedList.h
//  Hello Algorithm
//
//  Created by mac on 2021/9/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define ELEMENT_NOT_FOUNT (-1)

/**
 * 单向循环链表
 */
@interface GLCycleSignleLinkedList <ObjectType> : NSObject

#pragma mark - 增
- (void) addElement:(ObjectType)element;
- (void) addElement:(ObjectType)element atIndex:(int)index;

#pragma mark - 删
- (ObjectType) removeAtIndex:(int)index;
- (void) clear;

#pragma mark - 改
- (ObjectType) setElement:(ObjectType)element atIndex:(int)index;

#pragma mark - 查
- (int) size;
- (BOOL) isEmpty;
- (BOOL) containsElement:(ObjectType)element;
- (ObjectType) getElementAtIndex:(int)index;
- (int) indexOfElement:(ObjectType)element;

@end

NS_ASSUME_NONNULL_END
