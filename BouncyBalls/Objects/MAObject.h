//
//  MAObject.h
//  BouncyBalls
//
//  Created by Miles Alden on 8/9/12.
//  Copyright (c) 2012 MilesAlden. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Structs.h"
#import "Enums.h"


#define RECT20 CGRectMake(150,150, 20,20)

@interface MAObject : NSObject


// Positioning
@property CGPoint center;
@property CGRect frame;


// Size
@property float radius;

// Vector
@property MAVector vector;
@property MAVector velocity;

// Styling
@property CGColorRef color;
@property CGColorRef fillColor;

// Shape
@property MAShape shape;
@property CGMutablePathRef path;


// Next frame
@property CGPoint nextFrameCenter;


// Delta
@property CGPoint deltaPosition;


// Coefficient of restitution
@property float COR;


- (id)initWithShape: (MAShape)theShape frame:(CGRect)theFrame;
- (void)updateCenter: (CGPoint)newCenter;

@end
