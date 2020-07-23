//
//  PersonController.h
//  Cocoa Design Pattern Playground
//
//  Created by Nonye on 7/23/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// We have to put this up here so the property (delegate) can recognize there a protocol and it exists
// Called a "forward declaration" b/c it comes before the protocol

@protocol PersonControllerDelegate;

@interface PersonController : NSObject

// In swift - static let shared = PersonController()
+ (instancetype)sharedPersonController;
//@property (nonatomic, class, readonly) PersonController *sharedPersonController;
// These two lines are the same. Readonly means we are only getting the getter.

@property (nonatomic, weak) id<PersonControllerDelegate> delegate;

@end

// placing the protool underneath
// the protocol is conforming to the NSObject (its not the same as the type, but the type conforms to the protocol)

@protocol PersonControllerDelegate <NSObject>

@required // implicit

@optional

- (void)personController:(PersonController *)personController didObserveNewBirth:(id)person;

@end

NS_ASSUME_NONNULL_END
