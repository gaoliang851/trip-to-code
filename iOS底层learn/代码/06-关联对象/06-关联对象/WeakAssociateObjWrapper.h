//
//  WeakAssociateObjWrapper.h
//  06-关联对象
//
//  Created by gaoliang on 2021/12/7.
//

#import <Foundation/Foundation.h>
@class WeakObj;
NS_ASSUME_NONNULL_BEGIN

@interface WeakAssociateObjWrapper : NSObject
@property (weak,nonatomic) WeakObj *obj;
@end

NS_ASSUME_NONNULL_END
