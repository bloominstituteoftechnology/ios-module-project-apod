//
//  Person.m
//  Cocoa Design Pattern Playground
//
//  Created by Nonye on 7/23/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

#import "Person.h"

@implementation Person

-(instancetype)init{
    return [self initWithName:@"Nonye" birthDate:NSDate.now hairColor:PersonHairColorBlond];
}

- (instancetype)initWithName:(NSString *)aName birthDate:(NSDate *)aBirthDate hairColor:(PersonHairColor)aHairColor
{
    
    if (self = [super init]) {
        _fullName = aName.copy;
        _birthDate = aBirthDate;
        _hairColor = aHairColor;
    }
    return self;
}

// We are creating a method that will return a nsstring of random names
- (NSString *)generateRandomName;
{
    static NSArray *firstNames = nil;
    static NSArray *lastNames = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        firstNames = @[@"Roz", @"Nichoel", @"Lemuel", @"Aster"];
        lastNames = @[@"Salazar", @"@Young", @"Sanders", @"Habte" ];
    });
    
    NSUInteger randomIndex = arc4random_uniform((uint32_t)firstNames.count);
     NSString *randomFirstName = [firstNames objectAtIndex:randomIndex];
     NSString *randomLastNames = [lastNames objectAtIndex:arc4random_uniform((uint32_t)lastNames.count)];
    
    return [NSString stringWithFormat:@"%@ %@", randomFirstName, randomLastNames ];
}


@end
