//
//  Presenter.h
//  CleanObjC
//
//  Created by skyofdwarf on 2018. 2. 25..
//  Copyright © 2018년 yjkim. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol Presentable
@end

@protocol Presenter
@property (nullable, weak, nonatomic, readonly) id<Presentable> presentable;

- (nonnull instancetype)initWithPresentable:(nullable id<Presentable>)presentable;
@end


@interface Presenter : NSObject <Presenter>

- (nonnull instancetype)initWithPresentable:(nullable id<Presentable>)presentable;
@end
