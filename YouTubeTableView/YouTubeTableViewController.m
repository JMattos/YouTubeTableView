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
@synthesize networkGallery=_networkGallery;

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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 1;
    }else{
        return [self.dataModel.videoIDs count];
    }
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
    if ([indexPath section]==0) {
        static NSString *CellIdentifier = @"GalleryCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        cell.textLabel.text = @"Internet Photo Gallery";
        return cell;
    } else {
    
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
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return @"";      
}

#pragma mark - Table view delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {    
    if ([indexPath section]==0) {
        return 44;
    }else{
        return 120;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Only for Gallery
    if ([indexPath section]==0) {
        [self performSegueWithIdentifier:@"ShowGallery" sender:self];
        
        /* Brute Force Method, without a Segue
        UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(savePhoto)];
        NSArray *barItems = [NSArray arrayWithObjects:saveButton, nil];
        
        self.networkGallery = [[FGalleryViewController alloc] initWithPhotoSource:self barItems:barItems];                           
        [self.navigationController pushViewController:self.networkGallery animated:YES];
         */
    }
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UITableViewCell *cell = (UITableViewCell *) sender;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    
    if ([segue.identifier isEqualToString:@"ShowDetail"]) {
        YouTubeDetailVideoViewController *controller = (YouTubeDetailVideoViewController *) segue.destinationViewController;
        controller.currentVideo=[self.dataModel.videoIDs objectAtIndex:[indexPath row]];
    }else if ([segue.identifier isEqualToString:@"ShowGallery"]) {
        StoryBoardFGalleryViewController *controller = (StoryBoardFGalleryViewController *) segue.destinationViewController;
        //UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(savePhoto)];
        //controller.barItems=[NSArray arrayWithObjects:saveButton, nil];
        controller.beginsInThumbnailView=YES;
        controller.photoSource=sender;
    }
    
}
- (void) dataModelDataChanged:(DataModel *)dataModel{
    [self.tableView reloadData];
}

#pragma mark - FGalleryViewControllerDelegate Methods
- (int)numberOfPhotosForPhotoGallery:(FGalleryViewController *)gallery
{
    int num = [self.dataModel.imageURLs count];
	return num;
}


- (FGalleryPhotoSourceType)photoGallery:(FGalleryViewController *)gallery sourceTypeForPhotoAtIndex:(NSUInteger)index
{
    return FGalleryPhotoSourceTypeNetwork;
}


- (NSString*)photoGallery:(FGalleryViewController *)gallery captionForPhotoAtIndex:(NSUInteger)index
{
    NSString *caption;
    caption = [self.dataModel.imageCaptions objectAtIndex:index];
	return caption;
}


- (NSString*)photoGallery:(FGalleryViewController *)gallery urlForPhotoSize:(FGalleryPhotoSize)size atIndex:(NSUInteger)index {
    return [self.dataModel.imageURLs objectAtIndex:index];
}

- (void)handleTrashButtonTouch:(id)sender {
    // here we could remove images from our local array storage and tell the gallery to remove that image
    // ex:
    //[localGallery removeImageAtIndex:[localGallery currentIndex]];
}


- (void)handleEditCaptionButtonTouch:(id)sender {
    // here we could implement some code to change the caption for a stored image
}

@end
