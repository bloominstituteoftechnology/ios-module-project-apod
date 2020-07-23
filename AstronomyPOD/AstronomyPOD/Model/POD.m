//
//  POD.m
//  AstronomyPOD
//
//  Created by Nonye on 7/23/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

#import "POD.h"

@implementation POD

- (instancetype)initWithTitle:(NSString *)aTitle explanation:(NSString *)aExplanation copyright:(NSString *)aCopyright date:(NSDate *)aDate url:(NSURL *)aURL
{
    self = [super init];
    if (self)
    {
        _title = aTitle;
        _explanation = aExplanation;
        _copyright = aCopyright;
        _date = aDate;
        _url = aURL;
    }
    
    return self;
}

@end
