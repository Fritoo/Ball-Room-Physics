//
//  MAUtils.m
//  BouncyBalls
//
//  Created by Miles Alden on 8/22/12.
//  Copyright (c) 2012 MilesAlden. All rights reserved.
//

#import "MAUtils.h"
#import "UIWindow+MainWindow.h"

@implementation MAUtils


void MALog(NSString *format,...) {
    
    va_list ap;
    va_start (ap, format);
    if (![format hasSuffix: @"\n"]) {
        format = [format stringByAppendingString: @"\n"];
    }
    NSString *body =  [[NSString alloc] initWithFormat: format arguments: ap];
    
    
    va_end (ap);
    fprintf(stderr, "%s",[body UTF8String]);
}


CGPoint MAGetCenter (CGRect rect) {
    
    float halfWidth = rect.size.width / 2;
    float halfHeight = rect.size.height / 2;

    return CGPointMake(rect.origin.x + halfWidth,
                       rect.origin.y + halfHeight);
    
}

MAVector divideVectors ( MAVector a, float factor ) {
    
    MAVector vect = { a.x/factor, a.y/factor };
    return vect;
}

MAVector divideVectorByVector ( MAVector a, MAVector b ) {
    
    MAVector vect = { a.x/b.x, a.y/b.y };
    return vect;
}


MAVector multiplyVectorByVector ( MAVector a, MAVector b ) {
    
    MAVector vect = { a.x*b.x, a.y*b.y };
    return vect;
}

MAVector multiplyVectors ( MAVector a, float factor ) {
    
    MAVector vect = { a.x*factor, a.y*factor };
    return vect;
}

MAVector subtractVectors ( MAVector a, float subtractor ) {
    
    MAVector vect = { a.x-subtractor, a.y-subtractor };
    return vect;
}

MAVector subtractVectorByVector ( MAVector a, MAVector b ) {
    
    MAVector vect = { a.x-b.x, a.y-b.y };
    return vect;
}

CGPoint addVectors1 ( CGPoint a, float value ) {
    
    CGPoint vect = { a.x+value, a.y+value };
    
    return vect;

}

MAVector addVectors ( MAVector a, float value ) {
    
    MAVector vect = { a.x+value, a.y+value };
    
    return vect;
}

MAVector addVectorByVector ( MAVector a, MAVector b ) {
    
    MAVector vect = { a.x+b.x, a.y+b.y };
    return vect;
}


double dot ( MAVector a, MAVector b ) {
    
    double dotProduct;
    
    MAVector vect = { a.x*b.x, a.y*b.y };
    dotProduct = vect.x + vect.y;
    
    return dotProduct;
    
}

double dot1 ( MAVector a, CGPoint b ) {
    
    double dotProduct;
    
    MAVector vect = { a.x*b.x, a.y*b.y };
    dotProduct = vect.x + vect.y;
    
    return dotProduct;
    
}


float quickSqrt( float number )
{
    long i;
    float x2, y;
    const float threehalfs = 1.5F;
    
    x2 = number * 0.5F;
    y  = number;
    i  = * ( long * ) &y;                       // evil floating point bit level hacking
    i  = 0x5f3759df - ( i >> 1 );               // what the fuck?
    y  = * ( float * ) &i;
    y  = y * ( threehalfs - ( x2 * y * y ) );   // 1st iteration
    //      y  = y * ( threehalfs - ( x2 * y * y ) );   // 2nd iteration, this can be removed
    
    return y*number; // y * number = squareRoot.
}


double distanceToPoint (CGPoint pointA, CGPoint pointB) {
    
    
    // Pythagorean theorum
    float dx=pointA.x - pointB.x;
    float dy=pointA.y - pointB.y;
    float distance =   quickSqrt(  (dx*dx) + (dy*dy) );
    
    return distance;
    
}

double distanceToPoint1 (MAVector pointA, MAVector pointB) {
    
    
    // Pythagorean theorum
    float dx=pointA.x - pointB.x;
    float dy=pointA.y - pointB.y;
    float distance =   quickSqrt(  (dx*dx) + (dy*dy) );
    
    return distance;
    
}


CGPoint MARectGetCenter (CGRect rect) {
    
    return CGPointMake(rect.origin.x + rect.size.width/2, rect.origin.y + rect.size.height/2);
}

CGPoint MAVectorToCGPoint (MAVector vect) {
    
    return (CGPoint){vect.x, vect.y};
    
}

MAVector CGPointToMAVector (CGPoint vect) {
    
    return (MAVector){vect.x, vect.y};
    
}



@end
