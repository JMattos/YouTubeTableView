//
//  YouTubeDetailViewController.m
//  YouTubeTableView
//
//  Created by John Mattos on 2/12/12.
//  Copyright (c) 2012 Adobe. All rights reserved.
//

#import "YouTubeDetailViewController.h"
#import "YouTubeView.h"
#import "Video.h"

@implementation YouTubeDetailViewController
@synthesize currentVideo=_currentVideo;
@synthesize webView = _webView;
@synthesize videoTitleTextView = _videoTitleTextView;

-(void) setup{
    if (self.currentVideo) {
        self.videoTitleTextView.text = self.currentVideo.videoTitle;
        NSString *youTubeMoviewURL = NSLocalizedString(@"YouTube URL", nil);
        NSString *movieURL = [NSString stringWithFormat:@"%@%@", youTubeMoviewURL, self.currentVideo.youtubeURL];
        self.webView = [[YouTubeView alloc] initWithStringAsURL:movieURL frame:CGRectMake(0, 0, 320, 150)];
        [[self view] addSubview:self.webView];
        //self.webView.hidden=NO;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle
- (void)viewDidAppear:(BOOL)animated{
    [self setup];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [self setVideoTitleTextView:nil];
    [self setWebView:nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
