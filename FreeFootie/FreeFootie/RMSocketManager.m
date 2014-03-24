//
//  RMSocketManager.m
//  FreeFootie
//
//  Created by macmoniz on 2014-03-24.
//  Copyright (c) 2014 ryanmoniz. All rights reserved.
//

#import "RMSocketManager.h"

static RMSocketManager *_sharedInstance = nil;
static dispatch_once_t oncePredicate;

@implementation RMSocketManager

+ (RMSocketManager *)sharedInstance
{
   dispatch_once(&oncePredicate, ^{
      _sharedInstance = [[RMSocketManager alloc] init];
   });
   return _sharedInstance;
}



@end
