//
//  WHLPhoto.m
//  APOD
//
//  Created by Wyatt Harrell on 5/21/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

#import "WHLPhoto.h"

@implementation WHLPhoto

- (instancetype)init
{
    self = [super init];
    if (self) {
        _title = @"Wrongfully inititalized photo object.";
        _explanation = @"Wrongfully initialized photo object.";
        _date = [[NSDate alloc] init];
        _hdurl = nil;
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title explanation:(NSString *)explanation date:(NSDate *)date hdurl:(NSURL *)hdurl {
    self = [super init];
    if (self) {
        _title = title;
        _explanation = explanation;
        _date = date;
        _hdurl = hdurl;
    }
    return self;
}

@end
