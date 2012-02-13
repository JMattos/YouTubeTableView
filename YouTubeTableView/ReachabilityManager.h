//
//  ReachabilityManager.h
//  ColesCorner
//
//  Created by John Mattos on 2/10/12.
//  Copyright (c) 2012 Adobe. All rights reserved.
//

#import "Reachability.h"

@interface ReachabilityManager : NSObject <UIActionSheetDelegate>

@property (nonatomic, assign) BOOL isReachable;
@property (nonatomic, copy) NSString *messageTitle;
@property (nonatomic, copy) NSString *messageBody;

- (void)showReachabilityError;
@end
