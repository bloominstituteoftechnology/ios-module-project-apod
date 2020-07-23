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
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        personController = [[self alloc] initSharedInstance];
        // self refers to person controller
        // b/c its static, it will remember so it needs to be within this code snippet
        
    });
    return personController;
}

- (instancetype)initSharedInstance
{
    if (self = [super init]) {
        
    }
    return self; 
}






@end
