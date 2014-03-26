//
//  RMTeamsModel.h
//  FreeFootie
//
//  Created by macmoniz on 2014-03-26.
//  Copyright (c) 2014 ryanmoniz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RMTeamsModel : NSObject

@property (nonatomic, retain) NSNumber *idNumber;
@property (nonatomic, retain) NSString *teamNameString;
@property (nonatomic, retain) NSNumber *winsNumber;
@property (nonatomic, retain) NSNumber *lossesNumber;
@property (nonatomic, retain) NSNumber *tiesNumber;
@property (nonatomic, retain) NSNumber *poolMemberIDNumber;
@property (nonatomic, retain) NSString *coachNameString;
@property (nonatomic, retain) NSString *coachPhoneString;
@property (nonatomic, retain) NSNumber *schoolNumber;
@property (nonatomic, retain) NSArray  *playersArray;

@end
