//
//  PersonController.h
//  Cocoa Design Pattern Playground
//
//  Created by Nonye on 7/23/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PersonController : NSObject

// In swift - static let shared = PersonController()
+ (instancetype)sharedPersonController;
//@property (nonatomic, class, readonly) PersonController *sharedPersonController;
// These two lines are the same. Readonly means we are only getting the getter.




@end

NS_ASSUME_NONNULL_END
