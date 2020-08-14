//
//  ViewController.m
//  APOD
//
//  Created by Matthew Martindale on 8/13/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

#import "ViewController.h"
#import "PODFetcher.h"

@interface ViewController ()

@property PODFetcher *podFetcher;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.podFetcher = [[PODFetcher alloc] init];
    [self.podFetcher fetchPhotoOfTheDay:^(Photo * _Nullable photo, NSError * _Nullable error) {
        NSLog(@"Finished Fetching photo: %@, %@", photo.title, photo.url);
    }];
    
}


@end
