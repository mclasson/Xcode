//
//  Client.h
//  JsonAndCoreData
//
//  Created by Marcus Classon on 2013-04-24.
//  Copyright (c) 2013 Marcus Classon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "protocols.h"

@interface Client : NSObject
-(void) loadTweets: (id <DataLoadingComplete>)cb;
@end
