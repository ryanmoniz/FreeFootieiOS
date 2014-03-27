//
//  RMScoreViewController.m
//  FreeFootie
//
//  Created by macmoniz on 2014-03-26.
//  Copyright (c) 2014 ryanmoniz. All rights reserved.
//

#import "RMScoreViewController.h"


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
}

- (void)homeViewSwippedUp:(UISwipeGestureRecognizer *)recognizer
{
   if ([homeFlipView isKindOfClass:[JDFlipNumberView class]])
   {
      [homeFlipView setValue:homeScore++ animated:YES];
      [self animateView:homeFlipView toTargetValue:homeScore];
   }
}

- (void)homeViewSwippedDown:(UISwipeGestureRecognizer *)recognizer
{
   if ([homeFlipView isKindOfClass:[JDFlipNumberView class]])
   {
      [homeFlipView setValue:homeScore-- animated:YES];
      [self animateView:homeFlipView toTargetValue:homeScore];
   }
}

- (void)awayViewSwippedUp:(UISwipeGestureRecognizer *)recognizer
{
   if ([awayFlipView isKindOfClass:[JDFlipNumberView class]])
   {
      [awayFlipView setValue:awayScore++ animated:YES];
      [self animateView:awayFlipView toTargetValue:awayScore];
   }
}

- (void)awayViewSwippedDown:(UISwipeGestureRecognizer *)recognizer
{
   if ([awayFlipView isKindOfClass:[JDFlipNumberView class]])
   {
      [awayFlipView setValue:awayScore-- animated:YES];
      [self animateView:awayFlipView toTargetValue:awayScore];
   }
}

- (void)animateView:(JDFlipNumberView *)view toTargetValue:(NSInteger)targetValue;
{
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

@end
