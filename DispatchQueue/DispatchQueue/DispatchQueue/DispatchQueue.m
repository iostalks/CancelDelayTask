//
//  DispatchQueue.m
//  DispatchQueue
//
//  Created by Smallfly on 2017/5/1.
//  Copyright © 2017年 Smallfly. All rights reserved.
//

#import "DispatchQueue.h"

typedef void (^Closure)(void);

@implementation DispatchQueue {
    dispatch_queue_t _queue;
}

- (instancetype)initWithQueue:(dispatch_queue_t)queue {
    self = [super init];
    if (!self) return nil;
    _queue = queue;
    return self;
}

- (DispatchQueueTask)delay:(NSTimeInterval)time task:(void (^)())task {
    __block Closure closure = task;
    __block DispatchQueueTask result;

    DispatchQueueTask delayedClosure = ^(BOOL cancel) {
        Closure internalClouse = closure;
        if (internalClouse != nil) {
            if (cancel == NO) {
                dispatch_async(_queue, ^{
                    internalClouse();
                });
            }
        }
        closure = nil;
        result = nil;
    };
    
    result = delayedClosure;
    
    NSTimeInterval deadline = DISPATCH_TIME_NOW + time;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(deadline * NSEC_PER_SEC)), _queue, ^{
        if (delayedClosure != nil) {
            delayedClosure(NO);
        }
    });
    
    return result;
}

- (void)cancel:(DispatchQueueTask)task {
    if (task == nil) {
        return;
    }
    task(YES);
}

@end
