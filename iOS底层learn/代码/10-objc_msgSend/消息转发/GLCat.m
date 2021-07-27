//
//  GLCat.m
//  消息转发
//
//  Created by mac on 2021/6/26.
//

#import "GLCat.h"

@implementation GLCat
- (void) abc {
    NSLog(@"%@-%@",self,NSStringFromSelector(_cmd));
}
@end
