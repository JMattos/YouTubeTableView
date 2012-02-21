//
//  ReachabilityManager.m
//  ColesCorner
//
//  Created by John Mattos on 2/10/12.
//  Copyright (c) 2012 Gladiator Apps L.L.C.. All rights reserved.
//

#import "ReachabilityManager.h"

@interface ReachabilityManager()
-(void)reachabilityChanged:(NSNotification*)note;
@end

@implementation ReachabilityManager{
    Reachability *reachability;
}
@synthesize isReachable=_isReachable;
@synthesize messageBody=_messageBody;
@synthesize messageTitle=_messageTitle;

- (void)showReachabilityError {
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:self.messageTitle
                          message:self.messageBody
                          delegate: nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil];
    [alert show];
}

-(id) init{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self 
                                                 selector:@selector(reachabilityChanged:) 
                                                     name:kReachabilityChangedNotification 
                                                   object:nil];
        NSString *reachabilityURL = NSLocalizedString(@"Movie Reachability URL", nil);
        NSLog(@"Checking Reachability against %@", reachabilityURL);
        reachability = [Reachability reachabilityWithHostname:reachabilityURL];
        [reachability startNotifier];
        self.messageTitle = NSLocalizedString(@"Reachability Error Title", nil);
        self.messageBody = NSLocalizedString(@"Reachability Error Body", nil);
    }
    return self;
}

-(void) dealloc{
    [reachability stopNotifier];
	[[NSNotificationCenter defaultCenter] removeObserver:self name:kReachabilityChangedNotification object:nil];
}

#pragma mark - Reachability
-(void)reachabilityChanged:(NSNotification*)notification{
    reachability = [notification object];
    self.isReachable = [reachability isReachable];
    if (self.isReachable) {
        NSLog(@"Internet is now Reachable");
    }else{
        NSLog(@"Internet is NOT Reachable");
    }
}
@end
