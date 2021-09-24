//
//  GLPerson.m
//  04 - MRC
//
//  Created by mac on 2021/8/24.
//

#import "GLPerson.h"

@implementation GLPerson

//使用_dog对dog属性进行方法
//@synthesize dog = _dog;

//- (void) dealloc {
//    NSLog(@"%s",__func__);
//    self.dog = nil;
//    [super dealloc];
//}

- (void)setName:(NSString *)name {
    if (_name != name) {
        [_name release];
        _name = [name copy];
    }
}

- (NSString *) name {
    return _name;
}


@end
