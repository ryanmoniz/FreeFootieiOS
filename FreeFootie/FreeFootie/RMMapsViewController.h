//
//  RMSecondViewController.h
//  FreeFootie
//
//  Created by macmoniz on 2014-03-24.
//  Copyright (c) 2014 ryanmoniz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RMMapsViewController : UIViewController <CLLocationManagerDelegate,MKMapViewDelegate>

@property (nonatomic,retain) IBOutlet MKMapView *mapView;
@property (nonatomic,retain) CLLocationManager *locationManager;

@end
