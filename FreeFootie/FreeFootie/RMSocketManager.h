//
//  RMSocketManager.h
//  FreeFootie
//
//  Created by macmoniz on 2014-03-24.
//  Copyright (c) 2014 ryanmoniz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RMSocketManager : NSObject 

+ (RMSocketManager *)sharedInstance;

//Refs will search through a list of the day’s games (sorted by geographical nearness).
- (NSArray *)listOfGamesForDate:(NSDate *)date;

//• Refs can see a map for each game if they need directions!
- (NSArray *)mapsForGame:(id)game;

//• Refs choose which game they are taking by checking in.!
- (void)checkingInForGame:(id)game;

//• Once at the game, they can increment scores and submit the game results.!
- (void)submitScore:(NSDictionary *)score forGame:(id)game;

//• The ref can also show cards and book players for good or bad behaviour.!
- (void)submitCard:(id)card forPlayer:(id)player;
@end
