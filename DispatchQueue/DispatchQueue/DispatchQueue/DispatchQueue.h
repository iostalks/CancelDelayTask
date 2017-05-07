//
//  DispatchQueue.h
//  DispatchQueue
//
//  Created by Smallfly on 2017/5/1.
//  Copyright © 2017年 Smallfly. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^DispatchQueueTask)(BOOL);

@interface DispatchQueue : NSObject

- (instancetype)initWithQueue:(dispatch_queue_t)queue;

- (DispatchQueueTask)delay:(NSTimeInterval)time task:(void (^)())task;

- (void)cancel:(DispatchQueueTask)task;

@end
