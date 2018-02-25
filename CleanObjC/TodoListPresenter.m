//
//  TodoListPresenter.m
//  CleanObjC
//
//  Created by yjkim on 23/02/2018.
//  Copyright © 2018 yjkim. All rights reserved.
//

#import "TodoListPresenter.h"

@interface TodoListPresenter ()
@property (nonnull, unsafe_unretained, nonatomic) UIViewController<TodoListPresentable> *presentable;
@end


@implementation TodoListPresenter
@dynamic presentable;

- (void)showLoadingIndicator:(BOOL)show {
    [self.presentable showLoadingIndicator:show];
}

- (void)showToastWithMessage:(NSString *)msg {
    //NSLog(@"SHOW TOAST MESSAGE using global toaster: %@", msg);
    [self.presentable showToastWithMessage:msg];
}

- (void)updateWithItems:(NSArray<NSString *> *)items {
    NSLog(@"updateWithItems: %@", items);
    [self.presentable updateWithItems:items];
}


- (void)load:(RACSignal<NSArray<NSString *> *> *)loadSignal {
    @weakify(self)
    [[[loadSignal initially:^{
        @strongify(self)
        [self showLoadingIndicator:YES];
    }] finally:^{
        @strongify(self)
        [self showLoadingIndicator:NO];
    }] subscribeNext:^(NSArray<NSString *> *items) {
        @strongify(self)
        [self updateWithItems:items];
    } error:^(NSError * _Nullable error) {
        @strongify(self)
        [self showToastWithMessage:@"Error occured"];
    }];
}

- (void)save:(RACSignal<NSNumber *> *)saveSignal {
    @weakify(self)
    [[[saveSignal initially:^{
        @strongify(self)
        [self showLoadingIndicator:YES];
    }] finally:^{
        @strongify(self)
        [self showLoadingIndicator:NO];
    }] subscribeNext:^(NSNumber *success) {
        @strongify(self)
        if (success.boolValue) {
            [self showToastWithMessage:@"saved"];
        }
        else {
            [self showToastWithMessage:@"failed to save"];
        }
    } error:^(NSError * _Nullable error) {
        @strongify(self)
        [self showToastWithMessage:[NSString stringWithFormat:@"failed to save with error:%@", error.localizedDescription]];
    }];
}

@end
