//
//  MAUtils.m
//  BouncyBalls
//
//  Created by Miles Alden on 8/22/12.
//  Copyright (c) 2012 MilesAlden. All rights reserved.
//

#import "MAUtils.h"

@implementation MAUtils


CGPoint MAGetCenter (CGRect rect) {
    
    float halfWidth = rect.size.width / 2;
    float halfHeight = rect.size.height / 2;

    return CGPointMake(rect.origin.x + halfWidth,
                       rect.origin.y + halfHeight);
    
}
@end
