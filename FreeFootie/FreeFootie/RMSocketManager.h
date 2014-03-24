//
//  RMSocketManager.h
//  FreeFootie
//
//  Created by macmoniz on 2014-03-24.
//  Copyright (c) 2014 ryanmoniz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SRWebSocket.h"

@interface RMSocketManager : NSObject <SRWebSocketDelegate>
{
   SRWebSocket *socket;
}
+ (RMSocketManager *)sharedInstance;
@end
