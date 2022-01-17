//
//  NSObject+Tag.m
//  06-关联对象
//
//  Created by mac on 2021/2/1.
//

#import "NSObject+Tag.h"
#import <objc/runtime.h>
#import "WeakAssociateObjWrapper.h"

static void *objc_tag_key = &objc_tag_key;
static void *weak_obj_key = &weak_obj_key;
@implementation NSObject (Tag)

- (void)setTag:(NSString *)tag {
    objc_setAssociatedObject(self, objc_tag_key, tag, OBJC_ASSOCIATION_COPY);
}

- (NSString *)tag {
    return objc_getAssociatedObject(self, objc_tag_key);
}

- (void)setObj:(WeakAssociateObjWrapper *)obj {
    objc_setAssociatedObject(self, weak_obj_key, obj, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (WeakAssociateObjWrapper *)obj {
    return objc_getAssociatedObject(self, weak_obj_key);
}

@end
