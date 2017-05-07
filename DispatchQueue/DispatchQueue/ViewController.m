//
//  ViewController.m
//  DispatchQueue
//
//  Created by Smallfly on 2017/5/1.
//  Copyright © 2017年 Smallfly. All rights reserved.
//

#import "ViewController.h"
#import "DispatchQueue.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    dispatch_queue_t serial = dispatch_queue_create("serial", nil);
    DispatchQueue *dispatch = [[DispatchQueue alloc] initWithQueue:serial];
    
    DispatchQueueTask task = [dispatch delay:3 task:^{
        NSLog(@"拨打 110");
    }];

    [dispatch cancel:task];
}



@end
