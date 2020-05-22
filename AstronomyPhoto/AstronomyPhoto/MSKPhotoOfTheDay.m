//
//  MSKPhotoOfTheDay.m
//  AstronomyPhoto
//
//  Created by Lambda_School_Loaner_268 on 5/21/20.
//  Copyright © 2020 Lambda. All rights reserved.
//

#import "MSKPhotoOfTheDay.h"

@implementation MSKPhotoOfTheDay

 -(instancetype)initWithCopyright:(NSString *)copyright
                             date:(NSString *)date
                      explanation:(NSString *)explanation
                            hdurl:(NSString *)hdurl
                        mediaType:(NSString *)mediaType
                   serviceVersion:(NSString *)serviceVersion
                            title:(NSString *)title
                              url:(NSString *)url {
     self = [super init];
     if (self) {
         _copyright = copyright;
        _date = date;
        _explanation = explanation;
        _hdurl = hdurl;
        _mediaType = mediaType;
        _serviceVersion = serviceVersion;
        _title = title;
        _url = url;
     }
     return self;
}
-(instancetype)initFromDict:(NSDictionary *)dict {
    NSString *copyright = dict[@"copyright"];
    NSString *date = dict[@"date"];
    NSString *explanation = dict[@"explanation"];
    NSString *hdurl = dict[@"hdurl"];
    NSString *mediaType = dict[@"mediaType"];
    NSString *serviceVersion = dict[@"serviceVersion"];
    NSString *title = dict[@"title"];
    NSString *url = dict[@"url"];
    self = [self initWithCopyright:(NSString *)copyright
                              date:(NSString *)date
                       explanation:(NSString *)explanation
                             hdurl:(NSString *)hdurl
                         mediaType:(NSString *)mediaType
                    serviceVersion:(NSString *)serviceVersion
                             title:(NSString *)title
                               url:(NSString *)url];
    return self;
}
@end
