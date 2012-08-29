//
//  MAPlane.h
//  BouncyBalls
//
//  Created by Miles Alden on 8/23/12.
//  Copyright (c) 2012 MilesAlden. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Structs.h"

@interface MAPlane : NSObject


@property MAVector3 plane;
@property int tag;

- (NSString *)stringFromPlane;
- (NSString *)stringFromRaw;
- (CGRect)rectFromPlane;
- (MALine)lineFromPlane;


@end
