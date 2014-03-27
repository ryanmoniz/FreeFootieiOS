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
   flipView = [[JDFlipNumberView alloc] initWithDigitCount:0
                                           imageBundleName:@"JDFlipNumberViewIOS6"];
   flipView.value = 32;
   flipView.maximumValue = 128;
   flipView.reverseFlippingDisabled = NO;
   [self.view addSubview: flipView];

   [flipView animateDownWithTimeInterval:0.3];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
