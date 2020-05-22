//
//  MTGPictureModel.h
//  Astronomy Picture of the Day
//
//  Created by Mark Gerrior on 5/21/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MTGPictureModel : NSObject

@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSString *explanation;
@property (nonatomic, readonly, copy) NSURL *imageURL;
@property (nonatomic, readonly, copy) NSURL *hdImageURL;
@property (nonatomic, readonly) NSDate *date;

- (instancetype)initWithTitle:(NSString *)title
                  explanation:(NSString *)explanation
                     imageURL:(NSURL *)imageURL
                   hdImageURL:(NSURL *)hdImageURL
                         date:(NSDate *)date;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
