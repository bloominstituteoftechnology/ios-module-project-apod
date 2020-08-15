//
//  Picture.h
//  Daily_Astronomy_Picture
//
//  Created by Claudia Maciel on 8/13/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Picture : NSObject

@property (nonatomic, copy, readonly) NSString *dateString;
@property (nonatomic, copy, readonly) NSString *urlString;
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *explanation;
@property (nonatomic, copy, readonly) NSString *mediaType;

- (nonnull instancetype)initWithDateString:(NSString *)dateString
                                 urlString:(NSString *)urlString
                                     title:(NSString *)title
                               explanation:(NSString *)explanation
                                 mediaType:(NSString *)mediaType;

- (nullable instancetype)initWithDictionary:(NSDictionary *)dictionary;


@end

NS_ASSUME_NONNULL_END
