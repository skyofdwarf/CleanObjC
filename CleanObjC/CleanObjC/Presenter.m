//
//  Presenter.m
//  CleanObjC
//
//  Created by skyofdwarf on 2018. 2. 25..
//  Copyright © 2018년 yjkim. All rights reserved.
//

#import "Presenter.h"

@interface Presenter ()
@property (nullable, weak, nonatomic) id<Presentable> presentable;
@end


@implementation Presenter

- (nonnull instancetype)initWithPresentable:(nullable id<Presentable>)presentable {
    self = [super init];
    if (self) {
        self.presentable = presentable;
    }
    return self;
}

@end

