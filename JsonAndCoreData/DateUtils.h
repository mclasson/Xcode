//
//  DateUtils.h
//  Gss
//
//  Created by Marcus Classon on 2012-08-28.
//
//

#import <Foundation/Foundation.h>

@interface DateUtils : NSObject

+(NSDate*) toDateFromString: (NSString*) dateString;
+(NSString*) toShortDateStringFromString: (NSString*) dateString;
+(NSString*) toLongDateStringFromString: (NSString*) dateString;
+(NSString*) toLongDateStringFromDate: (NSDate*) dateString;
+(NSString*) toTimeStringFromString: (NSString*) dateString;
+(NSString*) toTimeStringFromDate: (NSDate*) date;

@end
