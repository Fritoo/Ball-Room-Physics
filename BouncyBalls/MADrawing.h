//
//  MADrawing.h
//  BouncyBalls
//
//  Created by Miles Alden on 8/9/12.
//  Copyright (c) 2012 MilesAlden. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MAObjectManager;

@interface MADrawing : NSObject


@property float framerate;
@property (strong) NSMutableArray *objectManager;

+ (void)launch;
+ (MADrawing *)controlPoint;

@end


