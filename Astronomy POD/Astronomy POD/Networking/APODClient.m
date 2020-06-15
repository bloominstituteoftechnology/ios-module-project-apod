//
//  APODClient.m
//  Astronomy POD
//
//  Created by David Wright on 6/14/20.
//  Copyright © 2020 David Wright. All rights reserved.
//

#import "APODClient.h"
#import "APODPicture.h"

//https://api.nasa.gov/planetary/apod?date=2019-12-05&api_key=xzmUahFwDGPpByWDNsKViE2p0cMIPU47PTee9xJd
static NSString *const APODBaseURLString = @"https://api.nasa.gov/planetary/apod";
static NSString *const APIKey = @"xzmUahFwDGPpByWDNsKViE2p0cMIPU47PTee9xJd";

@implementation APODClient

- (void)fetchPODWithDateString:(NSString *)dateString
             completionHandler:(APODFetcherCompletionHandler)completionHandler
{
    NSURL *url = [self urlForInfoForAPODPictureWithDateString:dateString];
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Error fetching rover info: %@", error);
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, error);
            });
            return;
        }
        
        NSError *jsonError;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (!dictionary) {
            NSLog(@"Error decoding JSON: %@", jsonError);
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, jsonError);
            });
            return;
        }
        
        APODPicture *aAPODPicture = [[APODPicture alloc] initWithDictionary:dictionary];
        if (!aAPODPicture) {
            NSError *error = [NSError errorWithDomain:@"APODPictureFetcherDomain" code:-1 userInfo:nil];
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, error);
            });
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(aAPODPicture, nil);
        });
        
    }] resume];
}

- (NSURL *)urlForInfoForAPODPictureWithDateString:(NSString *)dateString
{
    NSURL *baseURL = [NSURL URLWithString:APODBaseURLString];
    NSURLComponents *queryURLComponents = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    [queryURLComponents setQueryItems:@[[NSURLQueryItem queryItemWithName:@"date" value:dateString],
                                        [NSURLQueryItem queryItemWithName:@"api_key" value:APIKey]]];
    return [queryURLComponents URL];
}

@end
