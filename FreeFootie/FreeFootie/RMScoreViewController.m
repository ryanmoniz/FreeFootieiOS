//
//  RMScoreViewController.m
//  FreeFootie
//
//  Created by macmoniz on 2014-03-26.
//  Copyright (c) 2014 ryanmoniz. All rights reserved.
//

#import "RMScoreViewController.h"

#define GOAL_KEY 		 @"Goal"
#define GAME_TIME_KEY @"Game Time"

@interface RMScoreViewController ()

@end

@implementation RMScoreViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

   // setup flip number view style

	// Do any additional setup after loading the view.
   homeScore = 0;
   awayScore = 0;

   //SHOULD display team names above flip view

   homeFlipView = [[JDFlipNumberView alloc] initWithDigitCount:0
                                           imageBundleName:@"JDFlipNumberViewIOS6"];
   [homeFlipView setFrame:CGRectMake(190, 30, 100, 200)];
   homeFlipView.value = 0;
   homeFlipView.maximumValue = 128;
   homeFlipView.reverseFlippingDisabled = NO;
   [self.view addSubview: homeFlipView];

   awayFlipView = [[JDFlipNumberView alloc] initWithDigitCount:0
                                               imageBundleName:@"JDFlipNumberViewIOS6"];
   [awayFlipView setFrame:CGRectMake(30, 30, 100, 200)];
   awayFlipView.value = 0;
   awayFlipView.maximumValue = 128;
   awayFlipView.reverseFlippingDisabled = NO;
   [self.view addSubview: awayFlipView];

   UISwipeGestureRecognizer *homeRecognizerUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(homeViewSwippedUp:)];
   [homeRecognizerUp setDirection:UISwipeGestureRecognizerDirectionUp];
   [homeFlipView addGestureRecognizer:homeRecognizerUp];

   UISwipeGestureRecognizer *homeRecognizerDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(homeViewSwippedDown:)];
   [homeRecognizerDown setDirection:UISwipeGestureRecognizerDirectionDown];
   [homeFlipView addGestureRecognizer:homeRecognizerDown];

   UISwipeGestureRecognizer *awayRecognizerUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(awayViewSwippedUp:)];
   [awayRecognizerUp setDirection:UISwipeGestureRecognizerDirectionUp];
   [awayFlipView addGestureRecognizer:awayRecognizerUp];

   UISwipeGestureRecognizer *awayRecognizerDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(awayViewSwippedDown:)];
   [awayRecognizerDown setDirection:UISwipeGestureRecognizerDirectionDown];
   [awayFlipView addGestureRecognizer:awayRecognizerDown];

   self.eventsArray = [[NSMutableArray alloc] init];

   //clock time
   // setup flipview

   gameTimeFlipView = [[JDDateCountdownFlipView alloc] initWithDayDigitCount:0 imageBundleName:@"JDFlipNumberViewIOS6"];
   [gameTimeFlipView setFrame:CGRectMake(CGRectGetMidX(self.view.frame)-130, CGRectGetMidY(self.view.frame)-30, 300, 400)];
   [self.view addSubview: gameTimeFlipView];


   // countdown to silvester
   NSDateComponents *currentComps = [[NSCalendar currentCalendar] components:NSYearCalendarUnit fromDate:[NSDate date]];
   NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
   [dateFormatter setDateFormat: @"dd.MM.yy HH:mm"];
   gameTimeFlipView.targetDate = [dateFormatter dateFromString:[NSString stringWithFormat: @"01.01.%d 00:00", currentComps.minute+90]];

   [gameTimeFlipView start];

}

- (NSString *)getCurrentGameTime {
   //display and show a game clock underneath flipView

   return [NSString stringWithFormat:@"%@:%@",[gameTimeFlipView minuteFlipNumberView],[gameTimeFlipView secondFlipNumberView]];
}

- (void)homeViewSwippedUp:(UISwipeGestureRecognizer *)recognizer
{
      [homeFlipView setValue:homeScore++ animated:YES];
      [self animateView:homeFlipView toTargetValue:homeScore];
}

- (void)homeViewSwippedDown:(UISwipeGestureRecognizer *)recognizer
{
      [homeFlipView setValue:homeScore-- animated:YES];
      [self animateView:homeFlipView toTargetValue:homeScore];
}

- (void)awayViewSwippedUp:(UISwipeGestureRecognizer *)recognizer
{
      [awayFlipView setValue:awayScore++ animated:YES];
      [self animateView:awayFlipView toTargetValue:awayScore];
}

- (void)awayViewSwippedDown:(UISwipeGestureRecognizer *)recognizer
{
      [awayFlipView setValue:awayScore-- animated:YES];
      [self animateView:awayFlipView toTargetValue:awayScore];
}

- (void)animateView:(JDFlipNumberView *)view toTargetValue:(NSInteger)targetValue;
{
   //should update events tableview with goal and timestamp of game
   [self.eventsArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"soccerball"],GOAL_KEY, [self getCurrentGameTime],GAME_TIME_KEY, nil]];
   [self.eventsTableView reloadData];

   NSDate *startDate = [NSDate date];
   [view animateToValue:targetValue duration:2.50 completion:^(BOOL finished) {
      if (finished) {
         NSLog(@"Animation needed: %.2f seconds", [[NSDate date] timeIntervalSinceDate:startDate]);
      } else {
         NSLog(@"Animation canceled after: %.2f seconds", [[NSDate date] timeIntervalSinceDate:startDate]);
      }
   }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView DataSource Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   static NSString *cellIdentifier = @"GameCell";
	UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
   if (cell == nil) {
      cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
   }

   cell.accessoryType = UITableViewCellAccessoryNone;
   
   return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   return [self.eventsArray count];
}

@end
