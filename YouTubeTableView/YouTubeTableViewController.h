//
//  YouTubeTableViewController.h
//  YouTubeTableView
//
//  Created by John Mattos on 2/12/12.
//  Copyright (c) 2012 Gladiator Apps L.L.C.. All rights reserved.
//
#import "DataModel.h"
#import "StoryBoardFGalleryViewController.h"

@interface YouTubeTableViewController : UITableViewController <DataModelDelegate, FGalleryViewControllerDelegate>

@property (nonatomic,strong) DataModel *dataModel;
@property (nonatomic, strong) FGalleryViewController *networkGallery;
@end
