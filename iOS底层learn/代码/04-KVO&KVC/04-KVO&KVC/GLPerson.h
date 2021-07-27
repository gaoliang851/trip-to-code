//
//  GLPerson.h
//  04-KVO&KVC
//
//  Created by mac on 2020/12/31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GLPerson : NSObject
{
    @public
    int _age;
}
- (void) setAge:(int)age;
- (int) age ;
@end

NS_ASSUME_NONNULL_END
