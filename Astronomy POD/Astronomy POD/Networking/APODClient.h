//
//  APODClient.h
//  Astronomy POD
//
//  Created by David Wright on 6/14/20.
//  Copyright © 2020 David Wright. All rights reserved.
//

#import <Foundation/Foundation.h>

@class APODPicture;

typedef void(^APODFetcherCompletionHandler)(APODPicture *_Nullable APODPicture, NSError *_Nullable error);

@interface APODClient : NSObject

- (void)fetchPODWithDateString:(nonnull NSString *)dateString
             completionHandler:(nonnull APODFetcherCompletionHandler)completionHandler;

@end
