//
//  DataModel.h
//  YouTubeTableView
//
//  Created by John Mattos on 2/12/12.
//  Copyright (c) 2012 Adobe. All rights reserved.
//

@class DataModel, ReachabilityManager;

@protocol DataModelDelegate <NSObject>
-(void) dataModelDataChanged:(DataModel *)dataModel;
@end

@interface DataModel : NSObject
@property (nonatomic, strong) NSMutableArray *videoIDs;
@property (nonatomic, strong) NSArray *imageURLs;
@property (nonatomic, strong) NSArray *imageCaptions;
@property (nonatomic, weak) id <DataModelDelegate> delegate;
@property (nonatomic, strong) ReachabilityManager *reachabilityManager;
@end
