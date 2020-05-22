//
//  Photo.h
//  APOD
//
//  Created by Shawn Gee on 5/22/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Photo : NSObject

@property (nonatomic, readonly, nullable) NSURL *url;
@property (nonatomic, readonly, nullable) NSURL *hdURL;
@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSString *explanation;
@property (nonatomic, readonly) NSDate *date;
@property (nonatomic, readonly, nullable) NSString *copyright;
@property (nonatomic, readonly) NSString *mediaType;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end


NS_ASSUME_NONNULL_END
