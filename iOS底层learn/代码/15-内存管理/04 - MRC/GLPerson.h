//
//  GLPerson.h
//  04 - MRC
//
//  Created by mac on 2021/8/24.
//

#import <Foundation/Foundation.h>
#import "GLDog.h"
NS_ASSUME_NONNULL_BEGIN

@interface GLPerson : NSObject
{
    NSString *_name;
}
@property (nonatomic,copy) NSString *name;
@end

NS_ASSUME_NONNULL_END
