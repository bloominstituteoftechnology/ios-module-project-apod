//
//  APODFetchPictureOperation.h
//  Astronomy POD
//
//  Created by David Wright on 6/14/20.
//  Copyright © 2020 David Wright. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APODFetchPictureOperation : NSOperation

@property (nonatomic, nullable) NSURL *pictureURL;
@property (nonatomic, nullable) UIImage *image;

- (nonnull instancetype)initWithPictureURL:(nonnull NSURL *)pictureURL;

- (void)start;
- (void)cancel;

@end
