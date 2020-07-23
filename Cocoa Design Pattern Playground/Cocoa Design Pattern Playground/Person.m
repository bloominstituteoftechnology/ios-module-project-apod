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
@end
