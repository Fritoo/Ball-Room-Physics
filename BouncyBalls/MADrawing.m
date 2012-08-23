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
#import "MAObjectManager.h"
#import <QuartzCore/QuartzCore.h>


    
static CADisplayLink *dlink = nil;
static MADrawing *controlPoint = nil;
static int r = 0;
static int g = 50;
static int b = 75;

@implementation MADrawing


void NSTNLog(NSString *format,...) {
    
    va_list ap;
    va_start (ap, format);
    if (![format hasSuffix: @"\n"]) {
        format = [format stringByAppendingString: @"\n"];
    }
    NSString *body =  [[NSString alloc] initWithFormat: format arguments: ap];
    
    
    va_end (ap);
    fprintf(stderr, "%s",[body UTF8String]);
}


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
        
    // Initialize manager
    [[MADrawing controlPoint] launchObjectManager];
    
    // Make some objects
    [[MADrawing controlPoint] buildObjects];
    
    // Start drawing
    dlink = [CADisplayLink displayLinkWithTarget:controlPoint selector:@selector(update)];
    [dlink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    
}



- (void)launchObjectManager {
    controlPoint.objectManager = [[NSMutableArray alloc] init];
}

- (void)buildObjects {
        
    // Build some objects
    MAObject *object[5];
    for ( int i = 0; i < 5; i++ ) {
        object[i] = [[MAObject alloc] initWithShape:circle frame:RECT20];
        [controlPoint.objectManager addObject:object[i]];
    }
    
}



- (void)update {

    
    // Update framerate
    self.framerate = 1/dlink.duration;
    
    
    for (MAObject *object in self.objectManager) {
    
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
                
        NSTNLog(@"Object: %@", object);

        

    }
    
    [[MACanvas mainCanvas] setNeedsDisplay];
    
}



@end
