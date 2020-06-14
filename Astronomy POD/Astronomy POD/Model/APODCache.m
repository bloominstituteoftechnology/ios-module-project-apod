//
//  APODCache.m
//  Astronomy POD
//
//  Created by David Wright on 6/14/20.
//  Copyright © 2020 David Wright. All rights reserved.
//

#import "APODCache.h"

@interface APODCache ()

@property (copy, readwrite) NSMutableDictionary<NSString *, id> *cache;
@property (copy, readonly) dispatch_queue_t queue;

@end


@implementation APODCache

- (instancetype)init
{
    if (self = [super init]) {
        _queue = dispatch_queue_create([@"AstronomyPODCacheQueue" UTF8String], nil);
    }
    return self;
}

- (void)cacheValue:(id)value ForKey:(nonnull NSString *)key
{
    dispatch_async(self.queue, ^{
        [self.cache setObject:value forKey:key];
    });
}

- (id)valueForKey:(nonnull NSString *)key
{
    __block id value;
    dispatch_sync(self.queue, ^{
        value = [self.cache objectForKey:key];
    });
    return value;
}

- (void)clear
{
    dispatch_async(self.queue, ^{
        [self.cache removeAllObjects];
    });
}

@end
