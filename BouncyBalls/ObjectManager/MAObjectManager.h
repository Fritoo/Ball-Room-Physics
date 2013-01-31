//
//  MAObjectManager.h
//  BouncyBalls
//
//  Created by Miles Alden on 8/9/12.
//  Copyright (c) 2012 MilesAlden. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MAObjectManager : NSObject

@property (strong) NSMutableArray *objectStore;

+ (MAObjectManager *)objectManager;
- (void)buildObjects;
+ (NSMutableArray *)objectStore;
+ (void)createVelocityBurst;
- (void)burst;


@end
