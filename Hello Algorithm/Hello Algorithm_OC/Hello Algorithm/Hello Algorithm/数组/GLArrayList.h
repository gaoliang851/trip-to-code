//
//  GLArrayList.h
//  Hello Algorithm
//
//  Created by mac on 2021/4/28.
//

#import <Foundation/Foundation.h>

static int const GL_ARRAY_LIST_NOT_FOUND = -1;

NS_ASSUME_NONNULL_BEGIN

@interface GLArrayList <ObjectType> : NSObject

#pragma mark - 初始化
- (instancetype) init;
- (instancetype) initWithCapaticy:(int)capaticy;
+ (instancetype) new __unavailable;

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
