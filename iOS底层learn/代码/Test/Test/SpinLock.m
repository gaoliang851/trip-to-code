//
//  SpinLock.m
//  Test
//
//  Created by mac on 2021/9/13.
//

#import "SpinLock.h"
#import <libkern/OSAtomic.h>
#import <stdatomic.h>

static int SPIN_LOCK_FLAG = 0;

@implementation SpinLock

- (void)lock {
//    while (OSAtomicCompareAndSwapLongBarrier(0,1,&SPIN_LOCK_FLAG)) {
//
//    }
}

- (void)unlock {
    
}

@end
