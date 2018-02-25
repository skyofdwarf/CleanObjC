//
//  VCRouter.m
//  CleanObjC
//
//  Created by skyofdwarf on 2018. 2. 25..
//  Copyright © 2018년 yjkim. All rights reserved.
//

#import "VCRouter.h"
#import "RouterSeguing.h"


@interface VCRouter ()
@property (nullable, weak, nonatomic) UIViewController *vc;
@end

@implementation VCRouter

- (instancetype)initWithViewController:(UIViewController *)vc {
    self = [super init];
    if (self) {
        self.vc = vc;
    }
    return self;
}

#pragma mark - Router protocol

- (void)performSegueWithIdentifier:(NSString *)identifier seguing:(RouterSegueingBlock)seguing {
    [self.vc performSegueWithIdentifier:identifier sender:[RouterSeguing newWithSeguing:seguing]];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([sender isKindOfClass:RouterSeguing.class]) {
        RouterSeguing *seguing = (RouterSeguing *)sender;
        [seguing runWithSegue:segue];
    }
}

@end

