//
//  YouTubeView.m
//  blogScratchApp
//
//  Created by John on 5/18/10.
//  Copyright 2010 iPhoneDeveloperTips.com. All rights reserved.
//

#import "YouTubeView.h"

@implementation YouTubeView

#pragma mark -
#pragma mark Initialization

- (YouTubeView *)initWithStringAsURL:(NSString *)urlString frame:(CGRect)frame;
{
    if (self = [super init]) {
        // Create webview with requested frame size
        self = [[UIWebView alloc] initWithFrame:frame];
    
        // HTML to embed YouTube video
        NSString *youTubeVideoHTML = NSLocalizedString(@"YouTube HTML", nil);
      
        // Populate HTML with the URL and requested frame size
        NSString *html = [NSString stringWithFormat:youTubeVideoHTML, urlString, frame.size.width, frame.size.height];

        
        // Load the html into the webview
        [self loadHTMLString:html baseURL:nil];
	}
  return self;  
}
@end
