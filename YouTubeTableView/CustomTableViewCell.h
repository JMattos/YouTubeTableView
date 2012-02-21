//
//  CustomTableViewCell.h
//  YouTubeTableView
//
//  Created by John Mattos on 2/12/12.
//  Copyright (c) 2012 Gladiator Apps L.L.C.. All rights reserved.
//

#import "YouTubeView.h"

@interface CustomTableViewCell : UITableViewCell
@property (nonatomic,strong) IBOutlet UILabel *videoTitleLabel;
@property (nonatomic,strong) IBOutlet UIWebView *youtubeView;
@end
