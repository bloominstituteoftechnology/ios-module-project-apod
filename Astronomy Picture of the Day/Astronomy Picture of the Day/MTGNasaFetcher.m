//
//  MTGNasaFetcher.m
//  Astronomy Picture of the Day
//
//  Created by Mark Gerrior on 5/21/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

#import "MTGNasaFetcher.h"
#import "LSIErrors.h"
#import "MTGPictureModel.h"

static NSString *baseURLString = @"https://api.nasa.gov/planetary/apod";

@implementation MTGNasaFetcher

- (void)fetchNasaDate:(NSDate *)date
                completionBlock:(MTGNasaFetcherCompletion)completionBlock {

    NSLog(@"fetch");

    NSURLComponents *urlComponents = [NSURLComponents componentsWithString:baseURLString];

//    NSISO8601DateFormatter *formatter = [[NSISO8601DateFormatter alloc] init];
//    NSString *startTimeString = [formatter stringFromDate:interval.startDate];
//    NSString *endTimeString = [formatter stringFromDate:interval.endDate];

    urlComponents.queryItems = @[
        [NSURLQueryItem queryItemWithName:@"date" value:@"2020-05-21"],
        [NSURLQueryItem queryItemWithName:@"hd" value:@"false"],
        [NSURLQueryItem queryItemWithName:@"api_key" value:@"Tm7jUvrHDCt5koL42rsCL9dOIQuxw9YnUIwbrzdX"],
    ];

    NSURL *url = urlComponents.URL;
    // guard let
//    if (!url) {
//        return;
//    }
    NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"url: %@", url);

        if (error) {
            completionBlock(nil, error);
            return;
        }

        if (!data) {
            NSError *dataError = errorWithMessage(@"No Nasa data returned", LSIDataNilError);
            completionBlock(nil, dataError);
            return;
        }

        NSError *jsonError = nil; // no error has happened ... if it's not nil after call, there is an error
        // & = address of error
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];

        if (jsonError) { // jsonError != nil
            completionBlock(nil, jsonError);
            return;
        }

        MTGPictureModel *model = [[MTGPictureModel alloc] initWithDictionary:dictionary];
        NSLog(@"model: %@", model.title);
        completionBlock(model, nil);
    }];

    [task resume];
}

@end
