//
//  MAPlaneCanvas.m
//  BouncyBalls
//
//  Created by Miles Alden on 8/25/12.
//  Copyright (c) 2012 MilesAlden. All rights reserved.
//

#import "MAPlaneCanvas.h"
#import "MAPlaneManager.h"
#import "MAPlane.h"
#import "MAUtils.h"

@implementation MAPlaneCanvas

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code

    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    CGContextSetStrokeColorWithColor(context, [[UIColor greenColor] CGColor]);
    CGContextSetLineWidth(context, 15);
    
    for ( MAPlane *plane in [MAPlaneManager planeStore] ) {
        MAVector factoredVect = { plane.plane.x*100, plane.plane.y*100 };
        CGPathMoveToPoint(path, NULL, factoredVect.x, factoredVect.y);
//        LogInfo(@"%@", [plane stringFromPlane]);
        
    }
    
    CGContextAddPath(context, path);
    CGContextStrokePath(context);
    CGPathRelease(path);
    

    
    
}


@end
