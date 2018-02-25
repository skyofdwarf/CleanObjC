//
//  TodoListRouter.m
//  CleanObjC
//
//  Created by skyofdwarf on 2018. 2. 24..
//  Copyright © 2018년 yjkim. All rights reserved.
//

#import "TodoListRouter.h"
#import "TodoDetailViewController.h"


@interface TodoListRouter ()
@end

@implementation TodoListRouter

- (void)showDetailsWithInput:(NSString *)input {
    [self performSegueWithIdentifier:@"showDetailSegue"
                              seguing:^(TodoDetailViewController *vc) {
                                 vc.input = input;
                             }
     ];
}

- (void)showAbout {
    UIViewController *tempVC = [UIViewController new];
    [self.vc.navigationController pushViewController:tempVC animated:YES];
}


@end
