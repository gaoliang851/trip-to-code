//
//  main.m
//  13-block整理
//
//  Created by gaoliang on 2022/3/1.
//

#import <Foundation/Foundation.h>

int main() {
    
}


struct __block_impl {
    void *isa; // isa指针
    int Flags; //标记位
    int Reserved; //保留位
    // 函数指针，指向封装的代码
    void *FuncPtr;
};

struct __block_des {
    // 保留位
    size_t reserved;
    // block结构体的大小
    size_t Block_size;
};

struct Block { // block的结构
    struct __block_impl impl;
    struct __block_des* Des;
};



typedef void(^GLBlock)(void);
void _main(int argc, const char * argv[]) {
    __block int age = 10;
    GLBlock block = ^() {
        age = 20;
    };
    block();
}

struct __Block_byref_age_0 {
    void *__isa; // isa，指针
    __Block_byref_age_0 *__forwarding; //执行自身的指针
    int __flags;
    int __size; // 自己结构体的值
    int age; //用来保存和使用的值
};
