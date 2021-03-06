//
//  RMSocketManager.m
//  FreeFootie
//
//  Created by macmoniz on 2014-03-24.
//  Copyright (c) 2014 ryanmoniz. All rights reserved.
//

#import "RMSocketManager.h"
#import "SRWebSocket.h"

static RMSocketManager *_sharedInstance = nil;
static dispatch_once_t oncePredicate;

#define IP_ADDRESS   @"http://192.168.1.1"
#define PORT_ADDRESS @"8080"

@interface RMSocketManager () <SRWebSocketDelegate> {
  SRWebSocket *socket;
}
@end

@implementation RMSocketManager

+ (RMSocketManager *)sharedInstance {
   dispatch_once(&oncePredicate, ^{
      _sharedInstance = [[RMSocketManager alloc] init];
   });
   return _sharedInstance;
}

- (void)closeConnection {
   socket.delegate = nil;
   [socket close];
   socket = nil;
}

- (id)init {
   if (self = [super init]) {
      //create a web socket connection
      socket = [[SRWebSocket alloc] initWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@:%@",IP_ADDRESS,PORT_ADDRESS]]]];
      [socket setDelegate:self];

      [socket open];

      return self;
   }

   return nil;
}

#pragma mark - Socket Rocket Delegate Methods

-(void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message{
   NSLog(@"%@",message);

}
-(void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error{

}
-(void)webSocket:(SRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean {
}

#pragma mark - Facade Design Pattern methods to call FreeFootie API

//Refs will search through a list of the day’s games (sorted by geographical nearness).
- (NSArray *)listOfGamesForDate:(NSDate *)date {
   // get on URL/ref/games/
   return nil;
}

//• Refs can see a map for each game if they need directions!
- (NSArray *)mapsForGame:(id)game {
   // get on URL/admin/location/:id

   return nil;
}

//• Refs choose which game they are taking by checking in.!
- (void)checkingInForGame:(id)game {
   //put on /URL/ref/games/:id
}

//• Once at the game, they can increment scores and submit the game results.!
- (void)submitScore:(NSDictionary *)score forGame:(id)game {
   //no where is the game score recorded,
   //need to determine winner, loser, draw, and update their standings data instead
   //put on /URL/public/standings/:id
}

//• The ref can also show cards and book players for good or bad behaviour.!
- (void)submitCard:(id)card forPlayer:(id)player {
   //i'm guessings its this purplecard.js file that handles in backend
   //put on /URL/ref/directives/:id
}



@end
