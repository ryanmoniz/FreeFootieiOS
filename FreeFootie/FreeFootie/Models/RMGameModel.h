//
//  RMGameModel.h
//  FreeFootie
//
//  Created by macmoniz on 2014-03-26.
//  Copyright (c) 2014 ryanmoniz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RMGameModel : NSObject

@property (nonatomic, retain) NSNumber *idNumber;
@property (nonatomic, retain) NSNumber *locationNumber;
@property (nonatomic, retain) NSDate   *date;
@property (nonatomic, retain) NSNumber *homeTeamIDNumber;
@property (nonatomic, retain) NSNumber *awayTeamIDNumber;
@property (nonatomic, retain) NSString *gameState;

@end
