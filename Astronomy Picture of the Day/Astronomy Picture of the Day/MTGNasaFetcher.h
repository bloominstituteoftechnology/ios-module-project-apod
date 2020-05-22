//
//  MTGNasaFetcher.h
//  Astronomy Picture of the Day
//
//  Created by Mark Gerrior on 5/21/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MTGPictureModel;

// Swift
// (model: Model, error: Error?)
typedef void (^MTGNasaFetcherCompletion)(MTGPictureModel * _Nullable model, NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface MTGNasaFetcher : NSObject

- (void)fetchNasaDate:(NSDate *)date
                completionBlock:(MTGNasaFetcherCompletion)completionBlock;

@end

NS_ASSUME_NONNULL_END
