//
//  GLLinkedListNode.h
//  Hello Algorithm
//
//  Created by mac on 2021/7/20.
//

#import <Foundation/Foundation.h>


/// 节点封装的数据类
@interface GLLinkedListNode : NSObject
/// 保存的数据
@property (strong,nonatomic) id element;
@property (strong,nonatomic) GLLinkedListNode *next;

- (instancetype)initWithElement:(id) element
                        andNext:(GLLinkedListNode *)next;

@end


