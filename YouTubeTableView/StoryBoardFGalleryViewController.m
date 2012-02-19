//
//  StoryBoardFGalleryViewController.m
//  YouTubeTableView
//
//  Created by John Mattos on 2/19/12.
//  Copyright (c) 2012 Adobe. All rights reserved.
//

#import "StoryBoardFGalleryViewController.h"

@interface StoryBoardFGalleryViewController ()

@end

@implementation StoryBoardFGalleryViewController

- (id)initWithCoder:(NSCoder *)aDecoder{
    NSLog(@"in initWithCoder of StoryBoardFGalleryViewController");
    self=[super initWithCoder:aDecoder];
    if (self) {
        self= [super initWithNibName:nil bundle:nil];
    }
    return self;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
