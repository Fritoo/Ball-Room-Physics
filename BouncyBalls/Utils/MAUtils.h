//
//  MAUtils.h
//  BouncyBalls
//
//  Created by Miles Alden on 8/22/12.
//  Copyright (c) 2012 MilesAlden. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Structs.h"


#define LOG_THIS(fmt, lvl, ...) MALog((@"%s[Line %d] [%@] " fmt), __PRETTY_FUNCTION__, __LINE__, lvl, ##__VA_ARGS__)
#define LogDebug(fmt, ...) LOG_THIS(fmt, @"Debug", ##__VA_ARGS__)
#define LogInfo(fmt, ...)  LOG_THIS(fmt, @"Info", ##__VA_ARGS__)


@interface MAUtils : NSObject

CGPoint MAGetCenter (CGRect rect);

MAVector divideVectors ( MAVector a, float factor );
MAVector divideVectorByVector ( MAVector a, MAVector b );

MAVector multiplyVectorByVector ( MAVector a, MAVector b );
MAVector multiplyVectors ( MAVector a, float factor );

MAVector subtractVectors ( MAVector a, float subtractor );
MAVector subtractVectorByVector ( MAVector a, MAVector b );

MAVector addVectors ( MAVector a, float value );
CGPoint  addVectors1 ( CGPoint a, float value );
MAVector addVectorByVector ( MAVector a, MAVector b );

double dot ( MAVector a, MAVector b );
double dot1 ( MAVector a, CGPoint b );

void MALog(NSString *format, ...);



@end
