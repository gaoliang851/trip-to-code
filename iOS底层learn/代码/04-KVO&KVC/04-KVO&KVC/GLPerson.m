//
//  GLPerson.m
//  04-KVO&KVC
//
//  Created by mac on 2020/12/31.
//

#import "GLPerson.h"

@implementation GLPerson
- (void) setAge:(int)age {
    _age = age;
}
- (int) age {
    return _age;
}

@end
