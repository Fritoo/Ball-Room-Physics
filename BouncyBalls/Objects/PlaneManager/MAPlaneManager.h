//
//  MAPlaneManager.h
//  BouncyBalls
//
//  Created by Miles Alden on 8/25/12.
//  Copyright (c) 2012 MilesAlden. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Structs.h"

@interface MAPlaneManager : NSObject

@property (strong) NSMutableArray *planeStore;

+ (MAPlaneManager *)planeManager;
- (void)buildPlanes;
+ (NSMutableArray *)planeStore;
+ (NSMutableArray *)buildPlaneStore: (MAVector3*)_planes count: (int)count;
+ (void)updatePlaneStore: (NSMutableArray *)newStore;
+ (void)incrementPlaneStoreVectorsBy: (float)increment;
+ (void)decrementPlaneStoreVectorsBy: (float)decrement;


@end
