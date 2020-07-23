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
        // configure the shared instance any way that you like
        
        [NSTimer scheduledTimerWithTimeInterval: 5
                                         target: self
                                       selector: @selector(recordNewBirth:)
                                       userInfo: nil
                                        repeats: YES];
    }
    return self; 
}

// CREATING THE SELECTOR
- (IBAction)recordNewBirth:(id)sender
// id is always the first argument
{
//    if ([self.delegate conformsToProtocol:@protocol(PersonControllerDelegate)]) { || this method sucks
    
    // we have to ask if it implements a method, now we go to viewcontroller.m
    if ([self.delegate respondsToSelector:@selector(personController:didObserveNewBirth:)]) {
        [self.delegate personController:self didObserveNewBirth:@"New Child"];
    }
}


@end
