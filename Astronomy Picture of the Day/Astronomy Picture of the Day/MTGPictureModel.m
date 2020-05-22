//
//  MTGPictureModel.m
//  Astronomy Picture of the Day
//
//  Created by Mark Gerrior on 5/21/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

#import "MTGPictureModel.h"

@implementation MTGPictureModel

- (instancetype)initWithTitle:(NSString *)title
                  explanation:(NSString *)explanation
                     imageURL:(NSURL *)imageURL
                   hdImageURL:(NSURL *)hdImageURL
                         date:(NSDate *)date {

    self = [super init];
    if (self == nil) { return nil; }

    _title       = [title copy];
    _explanation = [explanation copy];
    _imageURL    = [imageURL copy];
    _hdImageURL  = [hdImageURL copy];
    _date        = date;

    return self;

}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {

    NSString *title = dictionary[@"title"];
    NSString *explanation = dictionary[@"explanation"];
    NSString *imageURLString = dictionary[@"url"];
    NSString *hdImageURLString = dictionary[@"hdurl"];
    NSString *dateString = dictionary[@"date"];

    // Convert the URL's
    NSURL *imageURL = [NSURL URLWithString:imageURLString];
    NSURL *hdImageURL = [NSURL URLWithString:hdImageURLString];

    // Conver the date
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [dateFormat dateFromString:dateString];

    // check if required properties are non-nil, otherwise return nil

    // API Decision: Discard any null magnitudes, but print it out for investigation
//    if ([magnitudeNumber isKindOfClass:[NSNull class]]) {
//        magnitudeNumber = nil;
//        NSLog(@"Mag is null: %@", dictionary);
//    }

    // magnitude is optional
//    if (!(place || timeNumber || latitudeNumber || longitudeNumber)) {
//        return nil;  // failable init if missing required
//    }

    // return the object using the default init
    self = [self initWithTitle:title
                   explanation:explanation
                      imageURL:imageURL
                    hdImageURL:hdImageURL
                          date:date];

    return self;
}

@end
