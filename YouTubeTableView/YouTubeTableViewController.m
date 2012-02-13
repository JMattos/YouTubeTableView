//
//  YouTubeTableViewController.m
//  YouTubeTableView
//
//  Created by John Mattos on 2/12/12.
//  Copyright (c) 2012 Adobe. All rights reserved.
//

#import "YouTubeTableViewController.h"
#import "CustomTableViewCell.h"
#import "Video.h"
#import "YouTubeDetailVideoViewController.h"
#import "ReachabilityManager.h"
#import "DataModel.h"

@implementation YouTubeTableViewController
@synthesize dataModel=_dataModel;

-(id) initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.dataModel = [[DataModel alloc]init];
        self.dataModel.delegate=self;
    }
    return self;
}
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataModel.videoIDs count];
}

- (NSIndexPath *) tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (!self.dataModel.reachabilityManager.isReachable) {
        [self.dataModel.reachabilityManager showReachabilityError];
        return nil;
    }
    return indexPath;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"VideoCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    CustomTableViewCell *videoCell = (CustomTableViewCell *) cell;
    
    Video *theVideo = [self.dataModel.videoIDs objectAtIndex:[indexPath row]];
    
    // The Video's Label
    videoCell.videoTitleLabel.text = theVideo.videoTitle;
    
    // The YouTube WebView
    NSString *youTubeHTML = NSLocalizedString(@"YouTube Object HTML", nil);
    NSString *youTubeAPIKey = NSLocalizedString(@"YouTube API Key", nil);

    // The HTML String for the UIWebView
    NSString *htmlString=[[NSString alloc] initWithFormat:youTubeHTML, theVideo.youtubeURL, youTubeAPIKey, theVideo.youtubeURL, youTubeAPIKey];
    [[[videoCell.youtubeView subviews] lastObject] setScrollEnabled:NO];
    [videoCell.youtubeView loadHTMLString:htmlString baseURL:[NSURL URLWithString:nil]];

    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return @"";      
}

#pragma mark - Table view delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {    
    return 120;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Unused. look at PrepareForSegue instead
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UITableViewCell *cell = (UITableViewCell *) sender;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    
    if ([segue.identifier isEqualToString:@"ShowDetail"]) {
        YouTubeDetailVideoViewController *controller = (YouTubeDetailVideoViewController *) segue.destinationViewController;
        controller.currentVideo=[self.dataModel.videoIDs objectAtIndex:[indexPath row]];
    }
    
}
- (void) dataModelDataChanged:(DataModel *)dataModel{
    [self.tableView reloadData];
}
@end
