//
//  GLCycleLinkedList.h
//  Hello Algorithm
//
//  Created by mac on 2021/8/20.
//

#import <Foundation/Foundation.h>

#define GLCYCLELINKEDLIST_NOT_FOUND (-1)

/// 双向循环链表
@interface GLCycleLinkedList <E> : NSObject


#pragma mark - 增
- (void) addElement:(E)element;
- (void) addElement:(E)element atIndex:(int)index;

#pragma mark - 删
- (E) removeAtIndex:(int)index;
- (void) clear;

#pragma mark - 改
- (E) setElement:(E)element atIndex:(int)index;

#pragma mark - 查
- (int) size;
- (BOOL) isEmpty;
- (BOOL) containsElement:(E)element;
- (E) getElementAtIndex:(int)index;
- (int) indexOfElement:(E)element;

@end


