//
//  APODPicture.m
//  Astronomy POD
//
//  Created by David Wright on 6/14/20.
//  Copyright © 2020 David Wright. All rights reserved.
//

#import "APODPicture.h"

@implementation APODPicture

- (instancetype)initWithDateString:(NSString *)dateString urlString:(NSString *)urlString title:(NSString *)title explanation:(NSString *)explanation mediaType:(NSString *)mediaType
{
    if (self = [super init]) {
        _dateString = dateString.copy;
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
    
    NSString *urlString = [dictionary objectForKey:@"url"];
    if (![urlString isKindOfClass:[NSString class]]) return nil;
    
    NSArray *solDescriptionDictionaries = [dictionary objectForKey:@"photos"];
    if (![solDescriptionDictionaries isKindOfClass:[NSArray class]]) return nil;
    
    return [self initWithDateString:dateString urlString:urlString title:title explanation:explanation mediaType:mediaType];
}

@end
