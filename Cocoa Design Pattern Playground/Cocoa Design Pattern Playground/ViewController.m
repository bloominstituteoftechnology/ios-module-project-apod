//
//  ViewController.m
//  Cocoa Design Pattern Playground
//
//  Created by Nonye on 7/23/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

#import "ViewController.h"
#import "PersonController.h"

@interface ViewController () <PersonControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    PersonController *sharedInstanceA = PersonController.sharedPersonController;
    NSLog(@"Person Controller A: %@", sharedInstanceA);
    
    PersonController *sharedInstanceB = PersonController.sharedPersonController;
     NSLog(@"Person Controller B: %@", sharedInstanceB);
    
    PersonController.sharedPersonController.delegate = self;
}
// MARK: - PersonControllerDelegate
// we are implementing the selector method from personcontroller.m
-(void)personController:(PersonController *)personController didObserveNewBirth:(id)person
{
    if ([person isKindOfClass:NSString.class]) {
        NSLog(@"%@ is a string!", person);
    }
    
    if ([person isMemberOfClass:NSString.class]) {
        NSLog(@"%@ is actually a NSString!!", person);
    } else {
        NSLog(@"We were wrong, %@ is actually a %@", person, NSStringFromClass([person class]));
    }
    NSLog(@"We detected a new birth! %@", person);
}

@end
