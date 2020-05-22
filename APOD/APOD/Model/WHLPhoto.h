//
//  WHLPhoto.h
//  APOD
//
//  Created by Wyatt Harrell on 5/21/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WHLPhoto : NSObject

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *explanation;
@property (nonatomic, readonly) NSDate *date;
@property (nonatomic, readonly) NSURL *url;

- (instancetype)initWithTitle:(NSString *)title explanation:(NSString *)explanation date:(NSDate *)date url:(NSURL *)url;
@end

NS_ASSUME_NONNULL_END
