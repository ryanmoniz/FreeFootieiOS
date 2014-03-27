//
//  RMScoreViewController.h
//  FreeFootie
//
//  Created by macmoniz on 2014-03-26.
//  Copyright (c) 2014 ryanmoniz. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JDFlipNumberView.h"
#import "JDFlipClockView.h"
#import "JDFlipImageView.h"
#import "JDDateCountdownFlipView.h"
#import "UIView+JDFlipImageView.h"

@interface RMScoreViewController : UIViewController {
   JDFlipNumberView *homeFlipView;
   JDFlipNumberView *awayFlipView;
   int homeScore;
   int awayScore;

   JDDateCountdownFlipView *gameTimeFlipView;
}

@property (nonatomic, retain) IBOutlet UITableView *eventsTableView;
@property (nonatomic, retain) NSMutableArray 		*eventsArray;
@end
