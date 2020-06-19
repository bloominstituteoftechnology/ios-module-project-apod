//
//  CMDPhoto.m
//  APOD
//
//  Created by Chris Dobek on 6/18/20.
//  Copyright © 2020 Chris Dobek. All rights reserved.
//

#import "CMDPhoto.h"

@implementation CMDPhoto

-(instancetype)initWithTitle:(NSString *)title explanation:(NSString *)explanation date:(NSDate *)date url:(NSURL *)url
{
    self = [super init];
    if (self)
    {
        _title = title;
        _explanation = explanation;
        _date = date;
        _url = url;
    }
    return self;
}

@end
