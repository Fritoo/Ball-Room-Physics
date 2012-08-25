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

@implementation MAConstants


+ (void)generateConfig {
    
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    float screenWidth = screenSize.width;
    float screenHeight = screenSize.height;
    meter = screenWidth;
    screenRatio = screenHeight/screenWidth;
    
    int success = [self startRealGravityMonitoring];
    MALog(@"Real gravity monitoring enabled. Success=%d", success);
    
    MAVector gravVector;
    if ( success ) {
        CMAcceleration gravAccel = [MAConstants realGravity];
        gravVector = (MAVector){ gravAccel.x, gravAccel.y };
    } else {
        gravVector = (MAVector){ 0, 9.8/meter*0.01 };
    }
    
    gravity =  gravVector;
    
}

+ (BOOL)startRealGravityMonitoring {
    
    motionManager = [[CMMotionManager alloc] init];
    if ( [motionManager isDeviceMotionAvailable] ) {
        return 0;
    }
    
    MALog(@"Starting device motion updates");
    [motionManager startDeviceMotionUpdates];
    return 1;
    
}

+ (void)stopRealGravityMonitoring {
    
    if ( !motionManager ) {
        return;
    }
    
    [motionManager stopDeviceMotionUpdates];
    
}

+ (CMAcceleration)realGravity {
    
    if ( !motionManager ) {
        return (CMAcceleration){0,0,0};
    }
    
    return [[motionManager deviceMotion] gravity];
    
}




@end