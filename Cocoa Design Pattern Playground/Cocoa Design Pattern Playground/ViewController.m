//
//  ViewController.m
//  Cocoa Design Pattern Playground
//
//  Created by Nonye on 7/23/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

#import "ViewController.h"
#import "PersonController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    PersonController *sharedInstanceA = PersonController.sharedPersonController;
    NSLog(@"Person Controller A: %@", sharedInstanceA);
    
    PersonController *sharedInstanceB = PersonController.sharedPersonController;
     NSLog(@"Person Controller B: %@", sharedInstanceB);
}


@end
