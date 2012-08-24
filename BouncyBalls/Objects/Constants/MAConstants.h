//
//  MAConstants.h
//  BouncyBalls
//
//  Created by Miles Alden on 8/23/12.
//  Copyright (c) 2012 MilesAlden. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Structs.h"

extern int meter;
extern float screenRatio;
extern MAVector gravity;
extern float pixelCompensation;

@interface MAConstants : NSObject


+ (void)generateConfig;


@end