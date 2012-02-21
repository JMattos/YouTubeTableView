//
//  DataModel.m
//  YouTubeTableView
//
//  Created by John Mattos on 2/12/12.
//  Copyright (c) 2012 Gladiator Apps L.L.C.. All rights reserved.
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
    videoOne.videoTitle =@"I Like Turtles";
    videoOne.youtubeURL = @"CMNry4PE93Y";
    [self.videoIDs addObject:videoOne];

    Video *video2 = [[Video alloc]init];
    video2.videoTitle =@"Dramatic Chipmunk";
    video2.youtubeURL = @"a1Y73sPHKxw";
    [self.videoIDs addObject:video2];
    
    Video *video3 = [[Video alloc]init];
    video3.videoTitle =@"Death Star Canteen";
    video3.youtubeURL = @"Sv5iEK-IEzw";
    [self.videoIDs addObject:video3];
    
    Video *video4 = [[Video alloc]init];
    video4.videoTitle =@"Scary Maki";
    video4.youtubeURL = @"14alLh3LglQ";
    [self.videoIDs addObject:video4];
    
    Video *video5 = [[Video alloc]init];
    video5.videoTitle =@"Chad Vader S01E01";
    video5.youtubeURL = @"4wGR4-SeuJ0";
    [self.videoIDs addObject:video5];
    
    
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
