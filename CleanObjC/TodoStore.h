//
//  TodoStore.h
//  CleanObjC
//
//  Created by skyofdwarf on 2018. 2. 25..
//  Copyright © 2018년 yjkim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC.h>

@interface TodoStore : NSObject

- (nonnull RACSignal *)load;
- (nonnull RACSignal *)save:(nonnull NSArray *)items;

@end
