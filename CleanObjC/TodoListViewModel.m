//
//  TodoListViewModel.m
//  CleanObjC
//
//  Created by yjkim on 23/02/2018.
//  Copyright © 2018 yjkim. All rights reserved.
//

#import "TodoListViewModel.h"


@interface TodoListViewModel ()
@end

@implementation TodoListViewModel

- (instancetype)init {
    return [self initWithInput:nil list:@[]];    
}

- (instancetype)initWithInput:(NSString *)input list:(NSArray *)list {
    self = [super init];
    if (self) {
        self.input = input;
        self.list = [NSMutableArray arrayWithArray:list];
    }
    return self;
}

- (void)addItem:(NSString *)item {
    [self.list addObject:item];
}

- (void)updateInput:(NSString *)input {
    self.input = input;
}

@end
