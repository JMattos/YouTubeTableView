//
//  YouTubeTableViewController.h
//  YouTubeTableView
//
//  Created by John Mattos on 2/12/12.
//  Copyright (c) 2012 Adobe. All rights reserved.
//
#import "DataModel.h"

@interface YouTubeTableViewController : UITableViewController <DataModelDelegate>

@property (nonatomic,strong) DataModel *dataModel;

@end
