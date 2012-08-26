//
//  MACanvas.m
//  BouncyBalls
//
//  Created by Miles Alden on 8/9/12.
//  Copyright (c) 2012 MilesAlden. All rights reserved.
//

#import "MACanvas.h"
#import "MADrawing.h"
#import "MAObjectManager.h"
#import "MAObject.h"

static MACanvas *canvas = nil;


@implementation MACanvas


+ (MACanvas *)mainCanvas {
    
    @synchronized(self) {
        if ( !canvas ) {
            canvas = [[MACanvas alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
            [[[UIApplication sharedApplication] delegate].window.rootViewController.view addSubview:canvas];
            canvas.backgroundColor = [UIColor whiteColor];
        }
    }
    return canvas;
    
}


#pragma mark -
#pragma mark __________________ 🚧 Singleton Methods 🚧 __________________


+ (id)allocWithZone:(NSZone *)zone {
    
    @synchronized(self) {
        if (canvas == nil) {
            canvas = [super allocWithZone:zone];
            return canvas;  // assignment and return on first allocation
        }
    }
    return nil; // on subsequent allocation attempts return nil
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}




#pragma mark -
#pragma mark __________________ 🌟 Drawing 🌟 __________________
#pragma mark -



- (void)drawRect:(CGRect)rect
{
    /*
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetMaxX(rect), CGRectGetMaxY(rect));
    CGPathCloseSubpath(path);
    CGContextAddPath(ctx, path);
    CGContextSetStrokeColorWithColor(ctx,[UIColor whiteColor].CGColor);
    CGContextStrokePath(ctx);
    CGPathRelease(path);

    return;
    */
    
    // Get context (canvas)
    CGContextRef context = UIGraphicsGetCurrentContext();

    // Cycle through objects
    for ( MAObject *object in [MAObjectManager objectStore] ) {
    
        // Draw
        CGContextAddPath(context, object.path);
        CGContextSetFillColorWithColor(context, object.color);
        CGContextFillPath(context);
        CGPathRelease(object.path);
    }
    

}


@end
