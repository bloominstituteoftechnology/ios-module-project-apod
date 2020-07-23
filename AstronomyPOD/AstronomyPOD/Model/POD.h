//
//  POD.h
//  AstronomyPOD
//
//  Created by Nonye on 7/23/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface POD : NSObject

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *explanation;
@property (nonatomic, copy, readonly) NSString *copyright;
@property (nonatomic, readonly) NSDate *date;
@property (nonatomic, readonly) NSURL *url;

-(instancetype)initWithTitle:(NSString *)aTitle explanation:(NSString *)aExplanation copyright:(NSString *)aCopyright date:(NSDate *)aDate url:(NSURL *)aURL;

@end

NS_ASSUME_NONNULL_END
