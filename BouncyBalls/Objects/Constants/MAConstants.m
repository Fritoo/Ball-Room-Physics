//
//  MAConstants.m
//  BouncyBalls
//
//  Created by Miles Alden on 8/23/12.
//  Copyright (c) 2012 MilesAlden. All rights reserved.
//

#import "MAConstants.h"

int meter = 0;
float screenRatio = 0;


@implementation MAConstants


+ (void)generateConfig {
    
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    float screenWidth = screenSize.width;
    float screenHeight = screenSize.height;
    meter = screenWidth;
    screenRatio = screenHeight/screenWidth;
    
}


@end