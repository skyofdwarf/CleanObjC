//
//  TodoListRouter.h
//  CleanObjC
//
//  Created by skyofdwarf on 2018. 2. 24..
//  Copyright © 2018년 yjkim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VCRouter.h"

@interface TodoListRouter : VCRouter

- (void)showAbout;
- (void)showDetailsWithInput:(nonnull NSString *)input;

@end
