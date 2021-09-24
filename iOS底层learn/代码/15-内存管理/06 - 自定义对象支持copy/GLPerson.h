//
//  GLPerson.h
//  06 - 自定义对象支持copy
//
//  Created by mac on 2021/8/27.
//

#import <Foundation/Foundation.h>
@class GLDog;
NS_ASSUME_NONNULL_BEGIN

@interface GLPerson : NSObject<NSCopying>
@property (nonatomic,assign) int age;
@property (nonatomic,assign) float weight;
@end

NS_ASSUME_NONNULL_END
