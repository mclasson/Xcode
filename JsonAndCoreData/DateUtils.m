//
//  DateUtils.m
//  Gss
//
//  Created by Marcus Classon on 2012-08-28.
//
//

#import "DateUtils.h"

@implementation DateUtils

+(NSDate*) toDateFromString: (NSString*) dateString
{
    NSDateFormatter *_dateFormatter = [[NSDateFormatter alloc]init];
    [_dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
    [_dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    
    return [_dateFormatter dateFromString:dateString];
    
}
+(NSString*) toShortDateStringFromString: (NSString*) dateString
{
    NSDateFormatter *_dateFormatter = [[NSDateFormatter alloc]init];
    [_dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
    [_dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    
    NSDate *date = [_dateFormatter dateFromString:dateString];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    return [dateFormatter stringFromDate:date];
}
+(NSString*) toLongDateStringFromString: (NSString*) dateString
{
    NSDateFormatter *_dateFormatter = [[NSDateFormatter alloc]init];
    [_dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
    [_dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    
    NSDate *date = [_dateFormatter dateFromString:dateString];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    return [dateFormatter stringFromDate:date];
}
+(NSString*) toLongDateStringFromDate: (NSDate*) date
{
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"CET"]];
    return [dateFormatter stringFromDate:date];
}
+(NSString*) toTimeStringFromString: (NSString*) dateString
{
    NSDateFormatter *_dateFormatter = [[NSDateFormatter alloc]init];
    [_dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
    [_dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    
    NSDate *date = [_dateFormatter dateFromString:dateString];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"HH:mm"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    return [dateFormatter stringFromDate:date];
}
+(NSString*) toTimeStringFromDate: (NSDate*) date
{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"HH:mm"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"CET"]];
    return [dateFormatter stringFromDate:date];
}
@end
