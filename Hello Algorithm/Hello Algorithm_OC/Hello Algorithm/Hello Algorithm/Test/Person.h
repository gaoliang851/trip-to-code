//
//  Person.h
//  Hello Algorithm
//
//  Created by mac on 2021/4/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic,copy) NSString *name;


+ (instancetype) personWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
