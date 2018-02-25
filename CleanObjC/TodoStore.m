//
//  TodoStore.m
//  CleanObjC
//
//  Created by skyofdwarf on 2018. 2. 25..
//  Copyright © 2018년 yjkim. All rights reserved.
//

#import "TodoStore.h"

#define DELAY_IN_SEC (0.5)

@interface TodoStore ()
@property (nonnull, strong, nonatomic) NSArray *items;
@end


@implementation TodoStore

- (instancetype)init {
    self = [super init];
    if (self) {
        self.items = @[ @"default", @"items" ];
    }
    return self;
}


- (RACSignal *)load {
    @weakify(self)
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSLog(@"loading in store");
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(DELAY_IN_SEC * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"loaded in store");
            @strongify(self)
            [subscriber sendNext:self.items];
            [subscriber sendCompleted];
        });
        
        return nil;
    }];
}

- (RACSignal *)save:(NSArray *)items {
    @weakify(self)
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSLog(@"saving in store");
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(DELAY_IN_SEC * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"saved in store");
            @strongify(self)
            self.items = [items copy];
            [subscriber sendNext:@YES];
            [subscriber sendCompleted];
        });
        
        return nil;
    }];
}

@end
