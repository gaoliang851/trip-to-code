//
//  GLLinkedList.h
//  Hello Algorithm
//
//  Created by mac on 2021/7/20.
//

#import <Foundation/Foundation.h>

static int const GL_LINKED_LIST_NOT_FOUND = -1;


@interface GLLinkedList <ObjectType> : NSObject

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

