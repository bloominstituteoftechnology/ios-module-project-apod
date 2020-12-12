//
//  PhotoOfTheDay.m
//  NasaPOD
//
//  Created by Cora Jacobson on 12/10/20.
//

#import "PhotoOfTheDay.h"

@implementation PhotoOfTheDay

- (instancetype)initWithTitle:(NSString *)aTitle
                         date:(NSDate *)aDate
                  explanation:(NSString *)anExplanation
                          url:(NSURL *)aURL
{
    if (self = [super init]) {
        _title = aTitle;
        _date = aDate;
        _explanation = anExplanation;
        _url = aURL;
    }
    return self;
}

- (nullable instancetype)initWithDictionary:(NSDictionary *)aDictionary
{
    NSString *title = [aDictionary objectForKey:@"title"];
    if (![title isKindOfClass:NSString.class]) return nil;
    
    NSString *dateString = [aDictionary objectForKey:@"date"];
    if (![dateString isKindOfClass:NSString.class]) return nil;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [[NSDate alloc] init];
    date = [formatter dateFromString:dateString];
    
    NSString *explanation = [aDictionary objectForKey:@"explanation"];
    if (![explanation isKindOfClass:NSString.class]) return nil;
    
    NSString *urlString = [aDictionary objectForKey:@"url"];
    if (![urlString isKindOfClass:NSString.class]) return nil;
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    if (![url isKindOfClass:NSURL.class]) return nil;
    
    return [self initWithTitle:title
                          date:date
                   explanation:explanation
                           url:url];
}

@end
