//
//  PersonController.m
//  Cocoa Design Pattern Playground
//
//  Created by Nonye on 7/23/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

#import "PersonController.h"

@implementation PersonController

+ (instancetype)sharedPersonController
{
    static PersonController *personController = nil;
    // we are creating a variable and initializing it to nil, so we have to check it
    if (!personController) {
        personController = [[self alloc] initSharedInstance];
        // self refers to person controller
        // b/c its static, it will remember
    }
    return personController;
}

- (instancetype)initSharedInstance
{
    if (self = [super init]) {
        
    }
    return self; 
}






@end
