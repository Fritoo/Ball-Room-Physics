//
//  MAObjectManager.m
//  BouncyBalls
//
//  Created by Miles Alden on 8/9/12.
//  Copyright (c) 2012 MilesAlden. All rights reserved.
//

#import "MAObjectManager.h"
#import "MAObject.h"
#import "MAConstants.h"
#import "MAUtils.h"
#import "MADrawing.h"
#import "Flurry.h"

MAObjectManager *objectManager = nil;

@implementation MAObjectManager


+ (MAObjectManager *)objectManager {
    
    if ( objectManager == nil ) {
        objectManager = [[MAObjectManager alloc] init];
        [objectManager launchObjectManager];

    }
    
    
    return objectManager;
}


- (void)launchObjectManager {
    
    // Create store of objects
    self.objectStore = [[NSMutableArray alloc] init];
    [objectManager buildObjects];
    
}


- (void)buildObjects {
    
    // Build some objects
    MAObject *object[NUM_OBJECTS];
    for ( int i = 0; i < NUM_OBJECTS; i++ ) {
        CGRect frameRect = CGRectMake((i+1)*30, (i+1)*36, 20, 20);
        object[i] = [[MAObject alloc] initWithShape:circle frame:frameRect];
        object[i].tag = i;
        [self.objectStore addObject:object[i]];
    }
    
}

+ (NSMutableArray *)objectStore {
    return objectManager.objectStore;
}

- (void)burst {
    
    [MAObjectManager createVelocityBurst];
    
}


+ (void)createVelocityBurst {
//    [Flurry logEvent:[NSString stringWithFormat:@"%@", NSStringFromSelector(_cmd)]];
    
    for ( MAObject *object in [MAObjectManager objectStore] ) {
        
        object.velocity = [object generateRandomVelocity];
        
    }
    
}

@end
