//
//  RMFirstViewController.h
//  FreeFootie
//
//  Created by macmoniz on 2014-03-24.
//  Copyright (c) 2014 ryanmoniz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RMGamesViewController : UIViewController

@property (nonatomic, retain) IBOutlet UITableView *gamesTableView;
@property (nonatomic, retain) NSMutableArray       *gamesArray;

@end
