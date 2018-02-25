//
//  TodoListInteractor.h
//  CleanObjC
//
//  Created by yjkim on 23/02/2018.
//  Copyright © 2018 yjkim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC.h>

#import "Interactor.h"
#import "TodoListPresenter.h"

@interface TodoListInteractor : Interactor

- (nonnull RACSignal *)load;
- (nonnull RACSignal *)save:(nonnull NSArray *)items;

- (nonnull instancetype)initWithPresenter:(nullable TodoListPresenter *)presenter;

@end
