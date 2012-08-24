//
//  MADrawing.m
//  BouncyBalls
//
//  Created by Miles Alden on 8/9/12.
//  Copyright (c) 2012 MilesAlden. All rights reserved.
//

#import "MADrawing.h"
#import "MACanvas.h"
#import "MAObject.h"
#import "MAPlane.h"
#import "MAObjectManager.h"
#import "MAUtils.h"
#import "MAConstants.h"
#import "MACollisionDetector.h"
#import <QuartzCore/QuartzCore.h>



    
static CADisplayLink *dlink = nil;
static MADrawing *controlPoint = nil;



@implementation MADrawing



+ (MADrawing *)controlPoint {
    @synchronized(self) {
        if ( !controlPoint ) {
            controlPoint = [[MADrawing alloc] init];
        }
    }
    return controlPoint;
}

+ (id)allocWithZone:(NSZone *)zone {
    
    @synchronized(self) {
        if (controlPoint == nil) {
            controlPoint = [super allocWithZone:zone];
            return controlPoint;  // assignment and return on first allocation
        }
    }
    return nil; // on subsequent allocation attempts return nil
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}


- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code
    }
    return self;
}



+ (void)launch {
        
    // Setup configurations
    [MAConstants generateConfig];
    
    // Initialize manager
    [[MADrawing controlPoint] launchObjectManager];
    
    // Make some objects
    [[MADrawing controlPoint] buildObjects];
    
    // Initialize planes manager
    [[MADrawing controlPoint] launchPlanesManager];
    
    // Make our confining planes
    [[MADrawing controlPoint] buildPlanes];
    
    // Start drawing
    dlink = [CADisplayLink displayLinkWithTarget:controlPoint selector:@selector(update)];
    [dlink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    
}



- (void)launchObjectManager {
    controlPoint.objectManager = [[NSMutableArray alloc] init];
}

- (void)buildObjects {
        
    // Build some objects
    MAObject *object[25];
    for ( int i = 0; i < 25; i++ ) {
        CGRect frameRect = CGRectMake((i+1)*30, (i+1)*36, 20, 20);
        object[i] = [[MAObject alloc] initWithShape:circle frame:frameRect];
        [controlPoint.objectManager addObject:object[i]];
    }
    
}


- (void)launchPlanesManager {
    
    controlPoint.planesManager = [[NSMutableArray alloc] init];
}

- (void)buildPlanes {
    
    MAVector3 _planes[4] = {
        
        // Took me awhile to understand this,
        // but these are not vector as position
        // in 3d space, but the normal of the plane.
        // { xDirection, yDirection, distanceToOrigin }
        (MAVector3){  1,  0, 1 },                   // Right
        (MAVector3){  0, -1, 1*meter*screenRatio }, // Up
        (MAVector3){ -1,  0, 1*meter },             // Left
        (MAVector3){  0,  1, 1 },                   // Down
        
    };

    MAPlane *plane[4];
    for ( int i = 0; i < 4; i++ ) {
        plane[i] = [[MAPlane alloc] init];
        plane[i].plane = _planes[i];
        [controlPoint.planesManager addObject:plane[i]];
    }
    
    
}
                   
                   


- (void)update {

    
    // Update framerate
    self.framerate = 1/dlink.duration;
    

    for (MAObject *object in self.objectManager) {
    
        
        #if defined(USE_PLANES) && USE_PLANES
                [MACollisionDetector checkPlaneCollisions:object];
        #else
                [MACollisionDetector checkScreenCollisions:object];
        #endif
        
        // Calcuate next integration
        CGPoint nextPosition;
        nextPosition.x = object.center.x + object.velocity.x * self.framerate;
        nextPosition.y = object.center.y + object.velocity.y * self.framerate;
        
        // Calculate what the deltaPosition
        // will be.
        CGPoint deltaPosition;
        deltaPosition.x = nextPosition.x - object.center.x;
        deltaPosition.y = nextPosition.y - object.center.y;
        object.deltaPosition = deltaPosition;
        [object updateCenter:nextPosition];

    }
    
    [[MACanvas mainCanvas] setNeedsDisplay];
        
}





@end
