//
//  APODFetchPictureOperation.m
//  Astronomy POD
//
//  Created by David Wright on 6/14/20.
//  Copyright © 2020 David Wright. All rights reserved.
//

#import "APODFetchPictureOperation.h"
#import "Astronomy POD-Bridging-Header.h"
#import "NSURL+Secure.h"

@interface APODFetchPictureOperation ()

// MARK: - Properties

@property (readwrite, getter=isExecuting) BOOL executing;
@property (readwrite, getter=isFinished) BOOL finished;
@property (readwrite, getter=isCancelled) BOOL cancelled;

@property NSURLSessionDataTask *dataTask;

@end


@implementation APODFetchPictureOperation

// MARK: - Initializers

- (instancetype)initWithPictureURL:(NSURL *)pictureURL
{
    if (self = [super init]) {
        _pictureURL = pictureURL;
        self.executing = NO;
        self.cancelled = NO;
        self.finished = NO;
    }
    return self;
}

// MARK: - Methods

- (void)start
{
    if (self.isCancelled) {
        self.finished = YES;
        return;
    }
    
    self.executing = YES;
    
    NSURL *URL = [self.pictureURL URLUsingHTTPS];
    
    NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithURL:URL
                                              completionHandler:^(NSData * _Nullable data,
                                                                  NSURLResponse * _Nullable response,
                                                                  NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching image from url: %@", error);
            return;
        }
        
        if (!data) {
            NSLog(@"Error receiving photo data");
            return;
        }
        
        UIImage *image = [UIImage imageWithData:data];
        
        if (!image) {
            NSLog(@"Error converting fetched data into image");
            return;
        }
        
        self.image = image;
        self.executing = NO;
        self.finished = YES;
    }];
    [task resume];
    self.dataTask = task;
}

- (void)cancel
{
    [self.dataTask cancel];
    self.executing = NO;
    self.cancelled = YES;
    self.finished = YES;
    [super cancel];
}

// MARK: - Custom Getters/Setters

// isAsynchronous

- (BOOL)isAsynchronous
{
    return YES;
}

// executing

@synthesize executing = _executing;

- (BOOL)isExecuting
{
    return _executing;
}

- (void)setExecuting:(BOOL)executing
{
    if (_executing != executing) {
        [self willChangeValueForKey:@"isExecuting"];
        _executing = executing;
        [self didChangeValueForKey:@"isExecuting"];
    }
}

// finished

@synthesize finished = _finished;

- (BOOL)isFinished
{
    return _finished;
}

- (void)setFinished:(BOOL)finished
{
    if (_finished != finished) {
        [self willChangeValueForKey:@"isFinished"];
        _finished = finished;
        [self didChangeValueForKey:@"isFinished"];
    }
}

// cancelled

@synthesize cancelled = _cancelled;

- (BOOL)isCancelled
{
    return _cancelled;
}

- (void)setCancelled:(BOOL)cancelled
{
    if (_cancelled != cancelled) {
        [self willChangeValueForKey:@"isCancelled"];
        _cancelled = cancelled;
        [self didChangeValueForKey:@"isCancelled"];
    }
}

@end
