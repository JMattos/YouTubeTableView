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
- (void) loadDummyVideoIDs;
@end

@implementation DataModel
@synthesize delegate=_delegate;
@synthesize imageURLs=_imageURLs;
@synthesize imageCaptions=_imageCaptions;
@synthesize videoIDs=_videoIDs;
@synthesize reachabilityManager=_reachabilityManager;

- (void) loadDummyRemoteImages{
    NSLog(@"Setting up the dummy remote images");
    self.imageCaptions = [[NSArray alloc] initWithObjects:@"Frosty Spiderweb",@"Happy New Year!",nil];

    self.imageURLs = [[NSArray alloc] initWithObjects:@"http://farm6.static.flickr.com/5042/5323996646_9c11e1b2f6_b.jpg", @"http://farm6.static.flickr.com/5007/5311573633_3cae940638.jpg",nil];
}

- (void) loadDummyVideoIDs{
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
        [self loadDummyVideoIDs];
        [self loadDummyRemoteImages];
    }
    return self;
}

-(void) dealloc{
    self.reachabilityManager=nil;
}
@end
