//
//  YouTubeDetailVideoViewController.h
//  YouTubeTableView
//
//  Created by John Mattos on 2/12/12.
//  Copyright (c) 2012 Gladiator Apps L.L.C.. All rights reserved.
//

@class Video;
@class YouTubeView;
@interface YouTubeDetailVideoViewController : UIViewController
@property (nonatomic, strong) Video *currentVideo;
@property (weak, nonatomic) IBOutlet YouTubeView *webView;
@property (weak, nonatomic) IBOutlet UITextView *videoTitleTextView;
- (IBAction)share:(id)sender;
@end
