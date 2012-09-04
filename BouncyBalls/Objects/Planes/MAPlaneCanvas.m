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
#import "MAConstants.h"

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
    CGContextSetLineWidth(context, 5);
    
    MAPlane *_plane0 = [[MAPlaneManager planeStore] objectAtIndex:0];
    MAPlane *_plane1 = [[MAPlaneManager planeStore] objectAtIndex:1];
    MAPlane *_plane2 = [[MAPlaneManager planeStore] objectAtIndex:2];
    MAPlane *_plane3 = [[MAPlaneManager planeStore] objectAtIndex:3];

    
    
    MAVector3 plane0 = _plane0.plane;
    MAVector3 plane1 = _plane1.plane;
    MAVector3 plane2 = _plane2.plane;
    MAVector3 plane3 = _plane3.plane;

    
    // Right |--->
    CGContextSetFillColorWithColor(context, [[UIColor greenColor] CGColor]);
    CGContextMoveToPoint(context, plane0.x,plane0.y);
    CGContextAddLineToPoint(context, meter, plane0.y*meter*screenRatio);
    CGContextStrokePath(context);
    
     
    
    // Left  <----|
    CGContextSetStrokeColorWithColor(context, [[UIColor blueColor] CGColor]);
    CGContextMoveToPoint(context,    plane1.x*-1*meter,  plane1.y);
    CGContextAddLineToPoint(context, plane1.x*-1*meter, (plane1.y+1)*meter*screenRatio  );
    CGContextStrokePath(context);
    
//
//    
//    // Up   ^
//    //      ^
//    //     ___
//    CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
//    CGContextMoveToPoint(context,     plane2.x,          plane2.y*-1*meter*screenRatio);
//    CGContextAddLineToPoint(context, (plane2.x+1)*meter, plane2.y*-1*meter*screenRatio);
//    CGContextStrokePath(context);
//    
//    
//    // Down ____
//    //
//    //       \/
//    //       \/
//    CGContextSetStrokeColorWithColor(context, [[UIColor orangeColor] CGColor]);
//    CGContextMoveToPoint(context,    plane3.x, plane3.y);
//    CGContextAddLineToPoint(context, (plane3.x+1)*meter, plane3.y);
//    CGContextStrokePath(context);
    
    


}
    
    


    
    



@end
