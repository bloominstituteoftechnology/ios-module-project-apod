//
//  PhotoOfTheDay.h
//  NasaPOD
//
//  Created by Cora Jacobson on 12/10/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PhotoOfTheDay : NSObject

@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSDate *date;
@property (nonatomic, readonly, copy) NSString *explanation;
@property (nonatomic, readonly, copy) NSURL *url;

- (instancetype)initWithTitle:(NSString *)aTitle
                         date:(NSDate *)aDate
                  explanation:(NSString *)anExplanation
                          url:(NSURL *)aURL;

- (nullable instancetype)initWithDictionary:(NSDictionary *)aDictionary;

@end

NS_ASSUME_NONNULL_END
