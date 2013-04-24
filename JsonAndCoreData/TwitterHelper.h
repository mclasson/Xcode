//
//  TwitterHelper.h
//  JsonAndCoreData
//
//  Created by Marcus Classon on 2013-04-24.
//  Copyright (c) 2013 Marcus Classon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tweet.h"
#import "protocols.h"
@interface TwitterHelper : NSObject<DataLoadingComplete>
@property (weak) NSManagedObjectContext *context;

-(Tweet*) Deserialize:(NSDictionary*)json tweet:(Tweet*)tweet;
-(void) GetTweets: (id<DataLoadingComplete>) cb;
@end
