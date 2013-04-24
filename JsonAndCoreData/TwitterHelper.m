//
//  TwitterHelper.m
//  JsonAndCoreData
//
//  Created by Marcus Classon on 2013-04-24.
//  Copyright (c) 2013 Marcus Classon. All rights reserved.
//

#import "TwitterHelper.h"
#import "Tweet.h"
#import "Client.h"
#import "protocols.h"

@implementation TwitterHelper
@synthesize context;
id<DataLoadingComplete> _cb;

-(Tweet*) Deserialize:(NSDictionary*)json tweet:(Tweet*)tweet
{
    
    NSDictionary *attributes = [[tweet entity] attributesByName];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init] ;
    [dateFormatter setDateFormat:@"eee MMM dd HH:mm:ss ZZZZ yyyy"];

    for (NSString *attribute in attributes) {
        NSAttributeType attributeType = [[attributes objectForKey:attribute] attributeType];
        id value = [json objectForKey:attribute];
        if (value == nil) {
            continue;
        }
        if ((attributeType == NSDateAttributeType) && ([value isKindOfClass:[NSString class]]) ) {
            value = [dateFormatter dateFromString:value];
        }
        if ((attributeType == NSStringAttributeType) && ([attribute isEqualToString:@"user"]) ) {
            value = [[json objectForKey:@"user"] objectForKey:@"name"];
        }
        [tweet setValue:value forKey:attribute];
    }
    return tweet;
}

-(void) GetTweets: (id<DataLoadingComplete>) cb
{
    Client *client = [[Client alloc] init];
    _cb = cb;
    [client loadTweets:self];
}

-(void)loadComplete:(NSDictionary*)payLoad
{
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Tweet" inManagedObjectContext:context];
    NSMutableArray * arrayOfTweets = [[NSMutableArray alloc] init];
    for (NSDictionary* dic in payLoad) {
        Tweet * tweet=[NSEntityDescription
                       insertNewObjectForEntityForName:[entity name]
                       inManagedObjectContext:context];
        Tweet * t = [self Deserialize:dic tweet:tweet];
        [arrayOfTweets addObject:t];
    }
    [_cb loadComplete:arrayOfTweets];
}
@end
