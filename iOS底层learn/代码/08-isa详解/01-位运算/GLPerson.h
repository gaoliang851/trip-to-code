//
//  GLPerson.h
//  01-位运算
//
//  Created by mac on 2021/4/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GLPerson : NSObject
@property (nonatomic,assign,getter=isTall) BOOL tall;
@property (nonatomic,assign,getter=isRich) BOOL rich;
@property (nonatomic,assign,getter=isHandsome) BOOL handsome;
@end

NS_ASSUME_NONNULL_END
