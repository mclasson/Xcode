//
//  Client.m
//  JsonAndCoreData
//
//  Created by Marcus Classon on 2013-04-24.
//  Copyright (c) 2013 Marcus Classon. All rights reserved.
//

#import "Client.h"
#import "protocols.h"
@interface Client()
{
  id <DataLoadingComplete>  callback;  
}
@end

@implementation Client

-(void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [receivedData setLength:0];
}

-(void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [connection cancel];
    //NSDictionary *userInfo = [error userInfo];
    
}
-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [receivedData appendData:data];
}
-(void) connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSError *error;
    NSArray* d = [NSJSONSerialization
                       JSONObjectWithData:receivedData
                       options:kNilOptions
                       error:&error];
    

    [callback loadComplete:d];
}

NSMutableData *receivedData;
-(void) loadTweets: (id <DataLoadingComplete>)cb
{
    callback = cb;
    
    NSError *error = NULL;
	NSURL *url = [NSURL URLWithString:@"https://api.twitter.com/1/statuses/user_timeline.json?include_entities=true&include_rts=true&screen_name=stratiteq&count=20" ] ;
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:10.0f];
	[request setHTTPMethod:@"GET"];
	[request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (connection)
    {
        receivedData = [NSMutableData data];
    }
}
@end
