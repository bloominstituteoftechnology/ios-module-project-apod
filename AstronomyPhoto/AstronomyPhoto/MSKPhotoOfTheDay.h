//
//  MSKPhotoOfTheDay.h
//  AstronomyPhoto
//
//  Created by Lambda_School_Loaner_268 on 5/21/20.
//  Copyright © 2020 Lambda. All rights reserved.
//

#import <Foundation/Foundation.h>




NS_ASSUME_NONNULL_BEGIN
@class MSKPhotoOfTheDay;
@interface MSKPhotoOfTheDay : NSObject
@property (nonatomic, copy) NSString *copyright;
@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *explanation;
@property (nonatomic, copy) NSString *hdurl;
@property (nonatomic, copy) NSString *mediaType;
@property (nonatomic, copy) NSString *serviceVersion;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *url;
-(instancetype)initWithCopyright:(NSString *)copyright
                            date:(NSString *)date
                     explanation:(NSString *)explanation
                           hdurl:(NSString *)hdurl
                       mediaType:(NSString *)mediaType
                  serviceVersion:(NSString *)serviceVersion
                           title:(NSString *)title
                             url:(NSString *)url;

NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_BEGIN
@end
@interface  MSKPhotoOfTheDay (NSJSONSerialization)
-(instancetype)initFromDict:(NSDictionary *)dict;
@end
NS_ASSUME_NONNULL_END
