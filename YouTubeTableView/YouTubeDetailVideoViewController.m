//
//  YouTubeDetailVideoViewController.m
//  YouTubeTableView
//
//  Created by John Mattos on 2/12/12.
//  Copyright (c) 2012 Gladiator Apps L.L.C.. All rights reserved.
//
// Credit goes to http://iphonedevelopertips.com/video/display-youtube-videos-without-exiting-your-application.html

#import "YouTubeDetailVideoViewController.h"
#import "YouTubeView.h"
#import "Video.h"
#import "SHK.h"

@implementation YouTubeDetailVideoViewController
@synthesize currentVideo=_currentVideo;
@synthesize webView = _webView;
@synthesize videoTitleTextView = _videoTitleTextView;

-(void) setup{
    NSLog(@"Setup");
    if (self.currentVideo) {
        self.videoTitleTextView.text = self.currentVideo.videoTitle;
        
        NSString *youTubeMoviewURL = NSLocalizedString(@"YouTube URL", nil);
        NSString *movieURL = [NSString stringWithFormat:@"%@%@", youTubeMoviewURL, self.currentVideo.youtubeURL];
        
        YouTubeView *youTubeView = [[YouTubeView alloc] initWithStringAsURL:movieURL frame:CGRectMake(0, 0, 320, 150)];
        [[self view] addSubview:youTubeView];
    }
}

- (id) initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        //
    }
    return self;
}

#pragma mark - View lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated{
    [self setup];
}

- (void)viewDidUnload
{
    [self setVideoTitleTextView:nil];
    [self setWebView:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)share:(id)sender {
    // Create the item to share (in this example, a url)
    NSURL *url = [NSURL URLWithString:@"http://getsharekit.com"];
    SHKItem *item = [SHKItem URL:url title:@"ShareKit is Awesome!"];
    
    // Get the ShareKit action sheet
    SHKActionSheet *actionSheet = [SHKActionSheet actionSheetForItem:item];
    
    // ShareKit detects top view controller (the one intended to present ShareKit UI) automatically,
    // but sometimes it may not find one. To be safe, set it explicitly
    [SHK setRootViewController:self];
    
    // Display the action sheet
    [actionSheet showInView:self.view];
}
@end
