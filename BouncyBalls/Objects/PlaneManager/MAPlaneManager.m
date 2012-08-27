//
//  MAPlaneManager.m
//  BouncyBalls
//
//  Created by Miles Alden on 8/25/12.
//  Copyright (c) 2012 MilesAlden. All rights reserved.
//

#import "MAPlaneManager.h"
#import "MAObject.h"
#import "MAConstants.h"
#import "MAUtils.h"
#import "MADrawing.h"
#import "MAPlane.h"


MAPlaneManager *planeManager = nil;

@implementation MAPlaneManager




+ (MAPlaneManager *)planeManager {
    
    if ( planeManager == nil ) {
        planeManager = [[MAPlaneManager alloc] init];
    }
    
    [planeManager launchPlaneManager];
    
    return planeManager;
}


- (void)launchPlaneManager {
    
    // Create a store of planes
    self.planeStore = [[NSMutableArray alloc] init];
    [planeManager buildPlanes];
}

- (void)buildPlanes {
    
    MAVector3 _planes[4] = {
        
        // Took me awhile to understand this,
        // but these are not vector as position
        // in 3d space, but the normal of the plane.
        // { xDirection, yDirection, distanceToOrigin }
        (MAVector3){  1,  0, 1},                     // Right
        (MAVector3){  0, -1, (1*meter)*screenRatio }, // Up
        (MAVector3){ -1,  0, 1*meter },             // Left
        (MAVector3){  0,  1, 1 }                      // Down
        
    };
    
    [MAPlaneManager updatePlaneStore:[MAPlaneManager buildPlaneStore:_planes count:4]];
    
}

+ (void)incrementPlaneStoreVectorsBy: (float)increment {
    
    for (MAPlane *plane in [MAPlaneManager planeStore]) {
        MAVector3 p1 = plane.plane;
        MAVector3 incrementedPlane = { p1.x + increment, p1.y + increment, p1.z + increment };
        plane.plane = incrementedPlane;
    }
}

+ (void)decrementPlaneStoreVectorsBy: (float)decrement {
    
    for (MAPlane *plane in [MAPlaneManager planeStore]) {
        MAVector3 p1 = plane.plane;
        MAVector3 decrementedPlane = { p1.x - decrement, p1.y - decrement, p1.z - decrement };
        plane.plane = decrementedPlane;
    }
}

+ (void)setPlaneStoreVectorsBy: (float)newValue {
    
    for (MAPlane *plane in [MAPlaneManager planeStore]) {
        MAVector3 p1 = plane.plane;
        MAVector3 newPlane = { newValue, newValue, p1.z };
        plane.plane = newPlane;
    }
    
}

+ (void)setPlaneStoreZValueBy: (float)newValue {
    
    for (MAPlane *plane in [MAPlaneManager planeStore]) {
        MAVector3 p1 = plane.plane;
        MAVector3 newPlane = { p1.x, p1.y, newValue };
        plane.plane = newPlane;
    }

    
}

+ (void)incrementPlaneStoreZValueBy: (float)increment {
    
    for (MAPlane *plane in [MAPlaneManager planeStore]) {
        MAVector3 p1 = plane.plane;
        MAVector3 incrementedPlane = { p1.x, p1.y, p1.z + increment };
        plane.plane = incrementedPlane;
    }
    
    
}



+ (NSMutableArray *)buildPlaneStore: (MAVector3*)_planes count: (int)count {
    
    NSMutableArray *interimStore = [[NSMutableArray alloc] init];
    
    MAPlane *plane[count];
    for ( int i = 0; i < count; i++ ) {
        if ( plane[i] == nil ) { plane[i] = [[MAPlane alloc] init]; }
        plane[i].plane = _planes[i];
        plane[i].tag = i;
        [interimStore addObject:plane[i]];
    }

    return interimStore;
    
}

+ (void)updatePlaneStore: (NSMutableArray *)newStore {
    
    planeManager.planeStore = newStore;
    
}


+ (NSMutableArray *)planeStore {
    return planeManager.planeStore;
}

@end
