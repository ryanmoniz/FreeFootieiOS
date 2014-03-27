//
//  RMSecondViewController.m
//  FreeFootie
//
//  Created by macmoniz on 2014-03-24.
//  Copyright (c) 2014 ryanmoniz. All rights reserved.
//

#import "RMMapsViewController.h"

@interface RMMapsViewController ()

@end

@implementation RMMapsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

   self.mapView.delegate = self;
   self.locationManager = [[CLLocationManager alloc] init];

   [self.locationManager setDelegate:self];
   [self.locationManager setDistanceFilter:kCLDistanceFilterNone];
   [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];

   [self.mapView setShowsUserLocation:YES];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
