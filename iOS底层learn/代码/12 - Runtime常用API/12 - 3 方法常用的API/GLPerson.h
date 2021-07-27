//
//  GLPerson.h
//  12 - 3 方法常用的API
//
//  Created by mac on 2021/7/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GLPerson : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) int age;
+ (void) printPersonInfo;
- (void) run;
@end

NS_ASSUME_NONNULL_END
