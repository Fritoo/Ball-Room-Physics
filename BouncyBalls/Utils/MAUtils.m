//
//  MAUtils.m
//  BouncyBalls
//
//  Created by Miles Alden on 8/22/12.
//  Copyright (c) 2012 MilesAlden. All rights reserved.
//

#import "MAUtils.h"

@implementation MAUtils


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


CGPoint MAGetCenter (CGRect rect) {
    
    float halfWidth = rect.size.width / 2;
    float halfHeight = rect.size.height / 2;

    return CGPointMake(rect.origin.x + halfWidth,
                       rect.origin.y + halfHeight);
    
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



MAVector addVectors ( MAVector a, MAVector b ) {
    
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

@end
