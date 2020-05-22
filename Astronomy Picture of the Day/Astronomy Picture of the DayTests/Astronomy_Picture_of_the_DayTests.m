//
//  Astronomy_Picture_of_the_DayTests.m
//  Astronomy Picture of the DayTests
//
//  Created by Mark Gerrior on 5/21/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

#import <XCTest/XCTest.h>
//#import "MTGPictureModel.m"

//@testable import Astronomy_Picture_of_the_Day

@interface Astronomy_Picture_of_the_DayTests : XCTestCase

@end

@implementation Astronomy_Picture_of_the_DayTests

//- (MTGPictureModel *)loadPictureModel:(NSString *)filename {
//
//    // Load test object from file.
//    NSData *modelData = loadFile(filename, [MTGPictureModel class]);
//    NSLog(@"modelData: %@", modelData);
//
//    // Pass through JSON Serializer
//    NSError *jsonError = nil;
//    NSDictionary *modelDictionary = [NSJSONSerialization JSONObjectWithData:modelData
//                                                                    options:0
//                                                                      error:&jsonError];
//    if (jsonError) {
//        NSLog(@"JSON Parsing error: %@", jsonError);
//    }
//
//    NSLog(@"JSON: %@", modelDictionary);
//
//    // Parse the dictionary and turn it into a CurrentWeather object
//
//    // Pass it through MTGPictureModel initializer
//    MTGPictureModel *model = [[MTGPictureModel alloc] initWithDictionary:modelDictionary];
//
//    return model;
//}


- (void)testApod {

//    NSString *filename = @"apod.json";
//    MTGPictureModel *model = [self loadPictureModel:filename];
//
//    NSLog(@"model: %@", model);
//
//    XCTAssertEqualObjects(@"Macklemore", model.);

    // Starts with test...
//    NSString *strToCompare = @"Ben Haggerty (born June 19, 1983)";
//    NSString *strToTest = [artist.biography substringToIndex:[strToCompare length]];
//    XCTAssertEqualObjects(strToCompare, strToTest);
//
//    XCTAssertEqual(1999, artist.formedYear);
}

@end
