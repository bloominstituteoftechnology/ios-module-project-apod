//
//  ViewController.m
//  Astronomy Picture of the Day
//
//  Created by Mark Gerrior on 5/21/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

#import "ViewController.h"
#import "MTGNasaFetcher.h"
#import "MTGPictureModel.h"


@interface ViewController ()

@property (nonatomic) MTGNasaFetcher *fetcher;
@property (nonatomic) NSMutableArray<MTGPictureModel *> *models;

@property (weak, nonatomic) IBOutlet UICollectionView *nasaCollectionView;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.models = [[NSMutableArray alloc] init];

    NSDate *date= [NSDate date];

    [self.fetcher fetchNasaDate:date completionBlock:^(MTGPictureModel * _Nullable model, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Nasa Fetching Error: %@", error);
            return;
        }

        NSLog(@"Model: %@", model.title);

        dispatch_async(dispatch_get_main_queue(), ^{

            [self.models addObject:model];

            [self updateViews];
        });

    }];

}

- (void)updateViews {
    NSLog(@"updateViews");
}

// Properties

// Lazy property
- (MTGNasaFetcher *)fetcher {
    if (!_fetcher) {
        _fetcher = [[MTGNasaFetcher alloc] init];
    }
    return _fetcher;
}

// Methods

- (void)fetchPhotosWithCompletition:(void (^)(NSArray<NSString *> *photos))completion {
    // network request ...
    completion(@[@"https://.../Photo.png"]);
}

@end
