//
//  Person.h
//  Cocoa Design Pattern Playground
//
//  Created by Nonye on 7/23/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

#import <Foundation/Foundation.h>

// adding the enumeration a the top
// we have to use the name of our enum name (PersonHairColor) within ever enum value
// each value will be assigned a value automatically starting at 0, or you can set them yourself (like us)
typedef NS_ENUM(NSUInteger, PersonHairColor) {
    PersonHairColorBrown = 0,
    PersonHairColorBlond = 1,
    PersonHairColorOrange = 2,
    PersonHairColorBlue = 3,
    PersonHairColorRed =4,
};

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, copy) NSString *fullName;
@property (nonatomic) NSDate *birthDate;
@property (nonatomic) PersonHairColor hairColor;

- (instancetype)initWithName:(NSString *)aName birthDate:(NSDate *)aBirthDate hairColor:(PersonHairColor)aHairColor NS_DESIGNATED_INITIALIZER;
//by marking it as ns_desig_init, to funnel initialzer to on subclass one intialzer vs initwithname and init and any others created
@end

NS_ASSUME_NONNULL_END
