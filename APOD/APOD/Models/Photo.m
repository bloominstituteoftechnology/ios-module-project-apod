//
//  Photo.m
//  APOD
//
//  Created by Shawn Gee on 5/22/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

#import "Photo.h"

@interface Photo ()


@end

@implementation Photo

static NSISO8601DateFormatter *_dateFormatter;

+ (NSISO8601DateFormatter *)dateFormatter {
    if (!_dateFormatter) {
        
        _dateFormatter = [[NSISO8601DateFormatter alloc] init];
        _dateFormatter.formatOptions = NSISO8601DateFormatWithFullDate;
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
