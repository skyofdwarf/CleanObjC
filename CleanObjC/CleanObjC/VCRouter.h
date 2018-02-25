//
//  VCRouter.h
//  CleanObjC
//
//  Created by skyofdwarf on 2018. 2. 25..
//  Copyright © 2018년 yjkim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Router.h"
#import "RouterSeguing.h"


@protocol VCRouter <Router>
@optional
@property (nullable, weak, nonatomic, readonly) UIViewController *vc;

- (void)prepareForSegue:(nonnull UIStoryboardSegue *)segue sender:(nullable id)sender;
- (void)performSegueWithIdentifier:(nonnull NSString *)identifier seguing:(nonnull RouterSegueingBlock)seguing;

@required
- (nonnull instancetype)initWithViewController:(nullable UIViewController *)vc;
@end


@interface VCRouter : NSObject <VCRouter>

@end

