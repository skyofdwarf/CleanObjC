//
//  RouterSeguing.m
//  CleanObjC
//
//  Created by skyofdwarf on 2018. 2. 25..
//  Copyright © 2018년 yjkim. All rights reserved.
//

#import "RouterSeguing.h"



@interface RouterSeguing ()
@property (nonnull, copy, nonatomic) RouterSegueingBlock seguing;
@end

@implementation RouterSeguing

+ (instancetype)newWithSeguing:(RouterSegueingBlock)seguing {
    return [[RouterSeguing alloc] initWithSeguing:seguing];
}

- (nullable instancetype)init {
    return nil;
}

- (instancetype)initWithSeguing:(RouterSegueingBlock)seguing {
    self = [super init];
    if (self) {
        self.seguing = seguing;
    }
    return self;
}

- (void)runWithSegue:(UIStoryboardSegue *)segue {
    self.seguing(segue.destinationViewController);
}
@end

