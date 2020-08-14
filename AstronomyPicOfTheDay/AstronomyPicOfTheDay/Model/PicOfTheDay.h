//
//  PicOfTheDay.h
//  AstronomyPicOfTheDay
//
//  Created by Chad Parker on 8/13/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PicOfTheDay : NSObject

@property (nonatomic, copy) NSString *copyright;
@property (nonatomic, copy) NSString *dateString;
@property (nonatomic, copy) NSString *explanation;
@property (nonatomic, copy) NSString *mediaType;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *urlString;

@end

NS_ASSUME_NONNULL_END
