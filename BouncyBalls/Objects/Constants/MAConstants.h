//
//  MAConstants.h
//  BouncyBalls
//
//  Created by Miles Alden on 8/23/12.
//  Copyright (c) 2012 MilesAlden. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Structs.h"
#import <CoreMotion/CoreMotion.h>


#define USE_PLANES 1
#define NUM_OBJECTS 5

extern int meter;
extern float screenRatio;
extern MAVector gravity;
extern float pixelCompensation;
extern CMMotionManager *motionManager;


@interface MAConstants : NSObject


+ (void)generateConfig;
+ (CMAcceleration)realGravity;
+ (void)stopRealGravityMonitoring;


@end