//
//  APODPicture.h
//  Astronomy POD
//
//  Created by David Wright on 6/14/20.
//  Copyright © 2020 David Wright. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APODPicture : NSObject

@property (nonatomic, copy, readonly, nonnull) NSString *dateString;
@property (nonatomic, copy, readonly, nonnull) NSString *urlString;
@property (nonatomic, copy, readonly, nonnull) NSString *title;
@property (nonatomic, copy, readonly, nonnull) NSString *explanation;   // "YYYY-MM-DD"
@property (nonatomic, copy, readonly, nonnull) NSString *mediaType;     // key: "media_type"

- (nonnull instancetype)initWithDateString:(nonnull NSString *)dateString
                                 urlString:(nonnull NSString *)urlString
                                     title:(nonnull NSString *)title
                               explanation:(nonnull NSString *)explanation
                                 mediaType:(nonnull NSString *)mediaType;

- (nullable instancetype)initWithDictionary:(nonnull NSDictionary *)dictionary;

@end
