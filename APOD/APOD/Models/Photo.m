//
//  Photo.m
//  APOD
//
//  Created by Shawn Gee on 5/22/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

#import "Photo.h"

@interface Photo ()

@property (class, nonatomic, readonly) NSDateFormatter *dateFormatter;

@end

@implementation Photo

static NSDateFormatter *_dateFormatter;

+ (NSDateFormatter *)dateFormatter {
    if (!_dateFormatter) {
        _dateFormatter = [[NSDateFormatter alloc] init];
        NSLocale *locale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
        _dateFormatter.dateFormat = [NSDateFormatter dateFormatFromTemplate:@"yyyy-MM-dd" options:0 locale:locale];
    }
    
    return _dateFormatter;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (!self) { return nil; }
    
    _url = [NSURL URLWithString:dictionary[@"url"]];
    _hdURL = [NSURL URLWithString:dictionary[@"hdurl"]];
    _title = dictionary[@"title"];
    _explanation = dictionary[@"explanation"];
    _date = [Photo.dateFormatter dateFromString:dictionary[@"date"]];
    _copyright = dictionary[@"copyright"];
    _mediaType = dictionary[@"media_type"];
    
    return self;
}

@end
