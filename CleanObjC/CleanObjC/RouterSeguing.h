//
//  RouterSeguing.h
//  CleanObjC
//
//  Created by skyofdwarf on 2018. 2. 25..
//  Copyright © 2018년 yjkim. All rights reserved.
//

#import <UIKit/UIKit.h>


#define ROUTER_SEGUEING(vc_type, vc_name, code_block) [RouterSeguing newWithSeguing:^(vc_type *vc_name) code_block]

typedef void (^RouterSegueingBlock)(__kindof UIViewController * _Nonnull vc);


@interface RouterSeguing: NSObject
@property (nonnull, copy, nonatomic, readonly) RouterSegueingBlock seguing;

+ (nonnull instancetype)newWithSeguing:(nonnull RouterSegueingBlock)seguing;
- (nonnull instancetype)initWithSeguing:(nonnull RouterSegueingBlock)seguing NS_DESIGNATED_INITIALIZER;

- (nullable instancetype)init NS_UNAVAILABLE;

- (void)runWithSegue:(nonnull UIStoryboardSegue *)segue;
@end


