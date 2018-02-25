//
//  TodoListPresenter.h
//  CleanObjC
//
//  Created by yjkim on 23/02/2018.
//  Copyright © 2018 yjkim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC.h>

#import "Presenter.h"


@protocol TodoListPresentable <Presentable>
- (void)showLoadingIndicator:(BOOL)show ;
- (void)showToastWithMessage:(nonnull NSString *)msg;
- (void)updateWithItems:(nonnull NSArray<NSString *> *)items;
@end


@interface TodoListPresenter : Presenter <Presenter>
@property (nonnull, unsafe_unretained, nonatomic, readonly) UIViewController<TodoListPresentable> *presentable;

- (void)showLoadingIndicator:(BOOL)show;
- (void)showToastWithMessage:(nonnull NSString *)msg;

- (void)load:(nonnull RACSignal<NSArray<NSString *> *> *)loadSignal;
- (void)save:(nonnull RACSignal<NSNumber *> *)saveSignal;

@end
