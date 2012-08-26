//
//  MADrawing.h
//  BouncyBalls
//
//  Created by Miles Alden on 8/9/12.
//  Copyright (c) 2012 MilesAlden. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MAObjectManager, MAPlaneManager, MAPlaneCanvas, MAControlPanelViewCon;

@interface MADrawing : NSObject


@property float framerate;
@property (strong) MAObjectManager *objectManager;
@property (strong) MAPlaneManager *planesManager;
@property (strong) MAPlaneCanvas *planeCanvas;
@property (strong) MAControlPanelViewCon *controlPanel;

+ (void)launch;
+ (MADrawing *)controlPoint;

@end


