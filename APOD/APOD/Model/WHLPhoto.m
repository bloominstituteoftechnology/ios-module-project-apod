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
        _imgSrc = nil;
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title explanation:(NSString *)explanation date:(NSDate *)date imgSrc:(NSURL *)imgSrc {
    self = [super init];
    if (self) {
        _title = title;
        _explanation = explanation;
        _date = date;
        _imgSrc = imgSrc;
    }
    return self;
}

@end
