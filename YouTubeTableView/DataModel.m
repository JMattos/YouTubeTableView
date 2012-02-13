//
//  DataModel.m
//  YouTubeTableView
//
//  Created by John Mattos on 2/12/12.
//  Copyright (c) 2012 Adobe. All rights reserved.
//

#import "DataModel.h"
#import "Video.h"
#import "ReachabilityManager.h"

@interface DataModel()
- (void) refreshDummyVideoIDs;
@end

@implementation DataModel
@synthesize delegate=_delegate;
@synthesize videoIDs=_videoIDs;
@synthesize reachabilityManager=_reachabilityManager;

- (void) refreshDummyVideoIDs{
    NSLog(@"Setting up the dummy data");
    self.videoIDs = [[NSMutableArray alloc] initWithCapacity:5];
    
    Video *videoOne = [[Video alloc]init];
    videoOne.videoTitle =@"The Basics of Striking";
    videoOne.youtubeURL = @"VmVegYZtau4";
    [self.videoIDs addObject:videoOne];

    Video *video2 = [[Video alloc]init];
    video2.videoTitle =@"Varying your stance and setting up your takedown";
    video2.youtubeURL = @"jIXKwRz_EP8";
    [self.videoIDs addObject:video2];
    
    Video *video3 = [[Video alloc]init];
    video3.videoTitle =@"How did you meet WoodysGamerTag?";
    video3.youtubeURL = @"QpgGUzReZo8";
    [self.videoIDs addObject:video3];
    
    Video *video4 = [[Video alloc]init];
    video4.videoTitle =@"Chael Sonnen is just Misunderstood";
    video4.youtubeURL = @"jPMWkn4qkGQ";
    [self.videoIDs addObject:video4];
    
    Video *video5 = [[Video alloc]init];
    video5.videoTitle =@"The Basics of Striking";
    video5.youtubeURL = @"VmVegYZtau4";
    [self.videoIDs addObject:video5];
    
    Video *video6 = [[Video alloc]init];
    video6.videoTitle =@"Varying your stance and setting up your takedown";
    video6.youtubeURL = @"jIXKwRz_EP8";
    [self.videoIDs addObject:video6];
    
    Video *video7 = [[Video alloc]init];
    video7.videoTitle =@"How did you meet WoodysGamerTag?";
    video7.youtubeURL = @"QpgGUzReZo8";
    [self.videoIDs addObject:video7];
    
    Video *video8 = [[Video alloc]init];
    video8.videoTitle =@"Chael Sonnen is just Misunderstood";
    video8.youtubeURL = @"jPMWkn4qkGQ";
    [self.videoIDs addObject:video8];
    
    // Remember to tell the delegate data has changed
    [self.delegate dataModelDataChanged:self];
}

-(id) init{
    self = [super init];
    self.reachabilityManager = [[ReachabilityManager alloc]init];
    if (self) {
        [self refreshDummyVideoIDs];
    }
    return self;
}

-(void) dealloc{
    self.reachabilityManager=nil;
}
@end
