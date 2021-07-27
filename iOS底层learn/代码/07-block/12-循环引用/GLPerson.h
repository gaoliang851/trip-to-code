//
//  Person.h
//  09-对象类型的auto变量
//
//  Created by mac on 2021/3/27.
//

#import <Foundation/Foundation.h>

typedef void(^GLBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface GLPerson : NSObject
@property (nonatomic,assign) int age;
@property (nonatomic,copy) GLBlock block;
@end

NS_ASSUME_NONNULL_END
