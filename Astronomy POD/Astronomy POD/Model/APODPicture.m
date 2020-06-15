//
//  APODPicture.m
//  Astronomy POD
//
//  Created by David Wright on 6/14/20.
//  Copyright © 2020 David Wright. All rights reserved.
//

#import "APODPicture.h"

@implementation APODPicture

- (instancetype)initWithDate:(NSDate *)date urlString:(NSString *)urlString title:(NSString *)title explanation:(NSString *)explanation mediaType:(NSString *)mediaType
{
    if (self = [super init]) {
        _date = date;
        _urlString = urlString.copy;
        _title = title.copy;
        _explanation = explanation.copy;
        _mediaType = mediaType.copy;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = [dictionary objectForKey:@"title"];
    if (![title isKindOfClass:[NSString class]]) return nil;
    
    NSString *explanation = [dictionary objectForKey:@"explanation"];
    if (![explanation isKindOfClass:[NSString class]]) return nil;
    
    NSString *mediaType = [dictionary objectForKey:@"media_type"];
    if (![mediaType isKindOfClass:[NSString class]]) return nil;
    
    NSString *dateString = [dictionary objectForKey:@"date"];
    if (![mediaType isKindOfClass:[NSString class]]) return nil;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    NSDate *date = [dateFormatter dateFromString:dateString];
    if (!date) return nil;
    
    NSString *urlString = [dictionary objectForKey:@"url"];
    if (![urlString isKindOfClass:[NSString class]]) return nil;
    
    return [self initWithDate:date urlString:urlString title:title explanation:explanation mediaType:mediaType];
}

@end
