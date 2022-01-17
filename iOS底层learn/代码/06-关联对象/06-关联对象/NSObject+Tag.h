//
//  NSObject+Tag.h
//  06-关联对象
//
//  Created by mac on 2021/2/1.
//

#import <Foundation/Foundation.h>
@class WeakAssociateObjWrapper;

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Tag)
@property (nonatomic,copy) NSString *tag;
@property WeakAssociateObjWrapper *obj;
@end

NS_ASSUME_NONNULL_END
