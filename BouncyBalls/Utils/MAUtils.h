//
//  MAUtils.h
//  BouncyBalls
//
//  Created by Miles Alden on 8/22/12.
//  Copyright (c) 2012 MilesAlden. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Structs.h"

@interface MAUtils : NSObject

CGPoint MAGetCenter (CGRect rect);

MAVector multiplyVectorByVector ( MAVector a, MAVector b );
MAVector multiplyVectors ( MAVector a, float factor );
MAVector subtractVectors ( MAVector a, float subtractor );
MAVector subtractVectorByVector ( MAVector a, MAVector b );
MAVector addVectors ( MAVector a, MAVector b );
double dot ( MAVector a, MAVector b );
double dot1 ( MAVector a, CGPoint b );
void NSTNLog(NSString *format,...);

@end
