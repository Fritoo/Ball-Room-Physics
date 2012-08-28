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
    CGContextSetStrokeColorWithColor(context, [[UIColor greenColor] CGColor]);
    CGContextSetLineWidth(context, 15);
    
    MAVector3 plane0 = (MAVector3)[[[MAPlaneManager planeStore] objectAtIndex:0] plane];
    MAVector3 plane1 = (MAVector3)[[[MAPlaneManager planeStore] objectAtIndex:1] plane];
    MAVector3 plane2 = (MAVector3)[[[MAPlaneManager planeStore] objectAtIndex:2] plane];
    MAVector3 plane3 = (MAVector3)[[[MAPlaneManager planeStore] objectAtIndex:3] plane];

    CGContextMoveToPoint(context, plane0.x, plane0.y);
    CGContextAddLineToPoint(context, plane0.x+plane0.z*meter, plane0.y);
    
    CGContextMoveToPoint(context, plane1.x, (plane1.y*meter*screenRatio)*-1);
    CGContextAddLineToPoint(context, plane1.x, plane1.y-plane1.z);
    
    CGContextMoveToPoint(context, (plane2.x*meter)*-1, plane2.y);
    CGContextAddLineToPoint(context, plane2.x-plane2.z, plane2.y);
    
    CGContextMoveToPoint(context, plane3.x, plane3.y*meter*screenRatio);
    CGContextAddLineToPoint(context, plane3.x, plane3.y-plane3.z);

        
    CGContextStrokePath(context);


}
    
    


    
    



@end
