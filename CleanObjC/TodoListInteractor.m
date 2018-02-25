//
//  TodoListInteractor.m
//  CleanObjC
//
//  Created by yjkim on 23/02/2018.
//  Copyright © 2018 yjkim. All rights reserved.
//

#import "TodoListInteractor.h"

#import "TodoStore.h"


@interface TodoListInteractor ()
@property (nullable, weak, nonatomic) TodoListPresenter *presenter;
@property (nonnull, strong, nonatomic) TodoStore *store;
@end


@implementation TodoListInteractor
@dynamic presenter;

- (instancetype)initWithPresenter:(TodoListPresenter *)presenter {
    self = [super initWithPresenter:presenter];
    if (self) {
        self.store = [TodoStore new];
    }
    return self;
}


- (RACSignal *)load {
    return [self.store load];
}

- (RACSignal *)save:(NSArray *)items {
    return [self.store save:items];
}

@end
