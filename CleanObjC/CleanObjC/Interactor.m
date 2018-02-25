//
//  Interactor.m
//  
//
//  Created by skyofdwarf on 2018. 2. 25..
//

#import "Interactor.h"

@interface Interactor ()
@property (weak, nonatomic) id<Presenter> presenter;
@property (nonnull, strong, nonatomic) NSArray *items;
@end


@implementation Interactor

- (instancetype)initWithPresenter:(id<Presenter>)presenter {
    self = [super init];
    if (self) {
        self.presenter = presenter;
    }
    return self;
}

@end
