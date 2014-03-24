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

- (id)init {
   if (self = [super init]) {
      //create a web socket connection
      socket = [[SRWebSocket alloc] initWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@:%@",IP_ADDRESS,PORT_ADDRESS]]]];

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
-(void)webSocket:(SRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean{
}



@end
