//
//  MADrawing.m
//  BouncyBalls
//
//  Created by Miles Alden on 8/9/12.
//  Copyright (c) 2012 MilesAlden. All rights reserved.
//


#import "MADrawing.h"

// View
#import "MACanvas.h"
#import "MAPlaneCanvas.h"
#import "MAControlPanelViewCon.h"

// Planes
#import "MAPlane.h"
#import "MAPlaneManager.h"

// Objects
#import "Objects/MAObject.h"
#import "MAObjectManager.h"

// Utils
#import "MAUtils.h"
#import "UIWindow+MainWindow.h"

// Constants
#import "MAConstants.h"

// Collision
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
    
    
    // Launch main canvas
    [MACanvas launchMainCanvas];
    
    // Initialize planes manager
    [[MADrawing controlPoint] launchPlanesManager];
        
    // Initialize manager
    [[MADrawing controlPoint] launchObjectManager];
    
    // Draw bounding box
//    [[MADrawing controlPoint] drawPlanes];
    
    // Control Panel
//    [[MADrawing controlPoint] launchControlPanel];

    // Start drawing
    dlink = [CADisplayLink displayLinkWithTarget:controlPoint selector:@selector(update)];
    [dlink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    
}



- (void)launchControlPanel {
    
    
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"ValueSliders" owner:self options:nil];
    LogInfo(@"Array: %@", array);
    
    self.controlPanel = [array objectAtIndex:1];
    
    [[[UIWindow rootViewController] view] addSubview:self.controlPanel.view];
    [self.controlPanel getReady];
}

- (void)launchObjectManager {
    
    // Launches manager and creates objects
    controlPoint.objectManager = [MAObjectManager objectManager];
}

- (void)launchPlanesManager {
    
    // Launches manager and creates planes
    controlPoint.planesManager = [MAPlaneManager planeManager];
}


- (void)drawPlanes {
    
    LogInfo(@"Drawing bounding box");
    self.planeCanvas = [[MAPlaneCanvas alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
    [[[UIWindow rootViewController] view] addSubview:self.planeCanvas];
    self.planeCanvas.transform = CGAffineTransformMakeScale(0.5, 0.5);
    
    LogInfo(@"\r\n\twindow: %@"
            @"\n\trootViewCon: %@"
            @"\n\tview: %@"
            @"\n\tsuperview: %@"
            @"\n\tbgColor: %@",
            [UIWindow mainWindow],
            [UIWindow rootViewController],
            [[UIWindow rootViewController] view],
            [[[UIWindow rootViewController] view] superview],
            [[[UIWindow rootViewController] view] backgroundColor]);

}
                   
                   


- (void)update {

    
    // Update framerate
    self.framerate = 1/dlink.duration;
    

    for (MAObject *object in [MAObjectManager objectStore]) {
        
#if defined(GRAVITY_ENABLED) && GRAVITY_ENABLED
        MAVector newVelocity = { object.velocity.x + gravity.x,// * self.framerate,
                                    object.velocity.y + gravity.y};// * self.framerate };
        object.velocity = newVelocity;
#endif
        
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
//    [self.planeCanvas setNeedsDisplay];
    
}





@end
