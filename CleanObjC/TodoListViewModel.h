//
//  TodoListViewModel.h
//  CleanObjC
//
//  Created by yjkim on 23/02/2018.
//  Copyright © 2018 yjkim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TodoListViewModel : NSObject
// data
@property (nonatomic,copy) NSString *input;
@property (strong, nonatomic) NSMutableArray *list;

- (instancetype)init;
- (instancetype)initWithInput:(NSString *)input list:(NSArray *)list;


// command
- (void)addItem:(NSString *)item;
- (void)updateInput:(NSString *)input;

@end
