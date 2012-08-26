//
//  MAConstants.m
//  BouncyBalls
//
//  Created by Miles Alden on 8/23/12.
//  Copyright (c) 2012 MilesAlden. All rights reserved.
//

#import "MAConstants.h"
#import "MAUtils.h"

int meter = 0;
float screenRatio = 0;
float pixelCompensation = 0.00001;
MAVector gravity;
CMMotionManager *motionManager = nil;
int usingRealGravity;

@implementation MAConstants


+ (void)generateConfig {
    
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    float screenWidth = screenSize.width;
    float screenHeight = screenSize.height;
    meter = screenWidth;
    
    LogInfo(@"\r\nmeter: %d\n"
             "screenWidth: %f\n"
             "screenSize: %f,%f\n"
             "bounds: %@\n",
             meter,
             screenWidth,
             screenSize.width,
             screenSize.height,
             NSStringFromCGRect([[UIScreen mainScreen] bounds]));
    
    screenRatio = screenHeight/screenWidth;
    
    int success = [self startRealGravityMonitoring];
    usingRealGravity = success;
    MALog(@"Real gravity monitoring enabled. Success=%d", success);
    
    MAVector gravVector;
    if ( success ) {
        gravVector = [MAConstants realGravity];
    } else {
        gravVector = (MAVector){ 0, 9.8/meter*0.01 };
    }
    
    gravity =  gravVector;
    LogInfo(@"gravVector: %0.2f,%0.2f", gravity.x, gravity.y);
    
}

+ (BOOL)startRealGravityMonitoring {

#if defined(GRAVITY_ENABLED) && GRAVITY_ENABLED
    motionManager = [[CMMotionManager alloc] init];
    if ( ![motionManager isDeviceMotionAvailable] || !motionManager ) {
        return 0;
    }
#else
    return 0;
#endif
    
    
    MALog(@"Starting device motion updates");
    [motionManager setDeviceMotionUpdateInterval:2/60];
    [motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMDeviceMotion *motion, NSError *e) {
        
        gravity = [MAConstants realGravity];
        
    }];
    
    return 1;
    
}

+ (void)stopRealGravityMonitoring {
    
    if ( !motionManager ) {
        return;
    }
    
    [motionManager stopDeviceMotionUpdates];
    
}

+ (MAVector)realGravity {
    
    if ( !motionManager ) {
        return (MAVector){0,0};
    }
    
    CMAcceleration grav = [[motionManager deviceMotion] gravity];
    MAVector result = (MAVector) { grav.x, grav.y * -1 };
//    result = multiplyVectors(result, -1);
    result = divideVectors(result, meter);
    result = multiplyVectors(result, 0.01);

    MALog(@"gravity update: %f, %f", result.x, result.y);
    return result;
}




@end