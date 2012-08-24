//
//  MACollisionDetector.h
//  BouncyBalls
//
//  Created by Miles Alden on 8/23/12.
//  Copyright (c) 2012 MilesAlden. All rights reserved.
//

#import <Foundation/Foundation.h>


@class MAObject;

@interface MACollisionDetector : NSObject


+ (void)checkPlaneCollisions: (MAObject *)object;
+ (void)checkScreenCollisions: (MAObject *)object;

@end
