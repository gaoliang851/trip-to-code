//
//  GLArrayList.m
//  Hello Algorithm
//
//  Created by mac on 2021/4/28.
//

#import "GLArrayList.h"
#import "GLListIndexOutOfBoundsException.h"

// 数组默认容量
static int const GL_ARRAY_LIST_DEFAULT_CAPATICY = 2;

typedef void * AnyObject;

@interface GLArrayList()
{
    //用来存放元素的数组
    AnyObject *_array;
    //用来记录_array中元素的数量
    int _size;
    //用来记录_array中的容量
    int _capacity;
}
@end

@implementation GLArrayList
#pragma mark - 初始化
- (instancetype) init {
    if (self = [super init]) {
        _array = calloc(GL_ARRAY_LIST_DEFAULT_CAPATICY, sizeof(AnyObject));
        _size = 0;
        _capacity = GL_ARRAY_LIST_DEFAULT_CAPATICY;
    }
    return self;
}
- (instancetype) initWithCapaticy:(int)capaticy {
    if (self = [super init]) {
        _array = calloc(capaticy, sizeof(AnyObject));
        _size = 0;
        _capacity = capaticy;
    }
    return self;
}


#pragma mark - 增

/// 将元素添加至数组最后
/// @param element 要添加的元素
- (void) addElement:(id)element {
    [self addElement:element atIndex:_size];
}
- (void) addElement:(id)element atIndex:(int)index {
    //先确定index是否合法
    if (index < 0 || index > _size) {
        @throw [GLListIndexOutOfBoundsException exeptionWithIndex:index];
    }
    //首先确保有size + 1 的容量，如果没有要扩容
    [self ensureCapaticy:_size + 1];
    // 把[index,size - 1]区间内从后开始，依次向后挪动一个单位
    for (int i = _size; i > index; i--) {
        _array[i] = _array[i - 1];
    }
    //将element插入index处
    _array[index] = (__bridge_retained AnyObject)element;
    _size++;
}


/// 确保_array有Capaticy的容量
/// @param capaticy 容量
- (void) ensureCapaticy:(int)capaticy {
    //如果当前容量大于capaticy, do nothing
    if (_capacity >= capaticy) return;
    //否则进行扩容，创建一个新数组，扩容为当前容量的1.5倍
    int newCapaticy = _capacity + (_capacity >> 1);
    GLLog(@"capaticy:%d -> %d",_capacity,newCapaticy);
    AnyObject *newArray = calloc(newCapaticy, sizeof(AnyObject));
    //将所有元素移入新数组中
    AnyObject *oldArray = _array;
    for (int i = 0; i < _size; i++) {
        newArray[i] = oldArray[i];
    }
    _array = newArray;
    _capacity = newCapaticy;
    free(oldArray);
}

#pragma mark - 删
- (id) removeAtIndex:(int)index {
    //首先检查index是否合法
    if (index < 0 || index > _size - 1) {
        @throw [GLListIndexOutOfBoundsException exeptionWithIndex:index];
    }
    //取出要移除的元素
    AnyObject elementToRemove = _array[index];
    //将[index+1,size -1]区间内的元素，从前到后依次向前移动一个单位
    for (int i = index; i < _size - 1; i++) {
        _array[i] = _array[i + 1];
    }
    _size--;
    GLLog(@"will remove %@",elementToRemove);
    return (__bridge_transfer id)elementToRemove;
}
- (void) clear {
    //遍历释放元素
    for (int i = 0; i < _size; i++) {
        CFRelease(_array[i]);
    }
    _size = 0;
}

#pragma mark - 改
- (id) setElement:(id)element atIndex:(int)index {
    //先检查index是否合法
    if (index < 0 || index > _size - 1) {
        @throw [GLListIndexOutOfBoundsException exeptionWithIndex:index];
    }
    //取出最后的元素以便返回
    AnyObject oldElement = _array[index];
    //将element覆盖index的位置
    _array[index] = (__bridge_retained AnyObject) element;
    CFRelease(oldElement);
    return (__bridge id)oldElement;
}

#pragma mark - 查
/// 获取当前数组中元素的数量
- (int) size {
    return self->_size;
}
/// 数组是否为空
- (BOOL) isEmpty {
    return self->_size == 0;
}
/// 数组中是否包含element元素
/// @param element 要对比的元素
- (BOOL) containsElement:(id)element {
    //遍历元素
    for (int i = 0; i < _size; i++) {
        if ([element isEqual:(__bridge id)(_array[i])]) return YES;
    }
    return YES;
}
/// 获取下标为index的元素
/// @param index 下标
- (id) getElementAtIndex:(int)index {
    //首先检查index是否合法
    if (index < 0 || index > _size - 1) {
        @throw [GLListIndexOutOfBoundsException exeptionWithIndex:index];
    }
    return (__bridge id)_array[index];
}

/// 获取element对应的下标
/// @param element element
- (int) indexOfElement:(id)element {
    for (int i = 0; i < _size; i++) {
        if ([element isEqual:(__bridge  id)_array[i]]) return i;
    }
    return GL_ARRAY_LIST_NOT_FOUND;
}

#pragma mark -

- (NSString *)description {
    NSMutableString *des = [NSMutableString string];
    [des appendFormat:@"size=%d,[",_size];
    for (int i = 0; i < _size; i++) {
        if (i != 0) {
            [des appendString:@","];
        }
        [des appendFormat:@"%@",_array[i]];
    }
    [des appendString:@"]"];
    return des;
}

- (void)dealloc
{
    [self clear];
}

@end
