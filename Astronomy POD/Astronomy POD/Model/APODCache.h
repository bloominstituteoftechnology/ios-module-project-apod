//
//  APODCache.h
//  Astronomy POD
//
//  Created by David Wright on 6/14/20.
//  Copyright © 2020 David Wright. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APODCache<Value> : NSObject

- (void)cacheValue:(nonnull Value)value ForKey:(nonnull NSString *)key;
- (nullable Value)valueForKey:(nonnull NSString *)key;
- (void)clear;

@end
