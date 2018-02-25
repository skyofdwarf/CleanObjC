//
//  Interactor.h
//  
//
//  Created by skyofdwarf on 2018. 2. 25..
//

#import <Foundation/Foundation.h>
#import "Presenter.h"


@protocol Interactor
@property (nullable, weak, nonatomic, readonly) id<Presenter> presenter;

- (nonnull instancetype)initWithPresenter:(nullable id<Presenter>)presenter;
@end


@interface Interactor : NSObject <Interactor>

@end
