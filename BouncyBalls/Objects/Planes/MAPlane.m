//
//  MAPlane.m
//  BouncyBalls
//
//  Created by Miles Alden on 8/23/12.
//  Copyright (c) 2012 MilesAlden. All rights reserved.
//

#import "MAPlane.h"
#import "MAConstants.h"
#import "MAUtils.h"

@implementation MAPlane


- (NSString *)stringFromPlane {
    
    return [NSString stringWithFormat:@"\r\n\t[%@]"
                                      @"\n\ttag: %d"
                                      @"\n\tvector { %0.3f, %0.3f, %0.3f }\n",
                                      NSStringFromClass([self class]),
                                      self.tag,
                                      self.plane.x,
                                      self.plane.y,
                                      self.plane.z];
    
}

- (NSString *)stringFromRaw {
    
    // Just return raw vector data
    // { a,b,c }
    return [NSString stringWithFormat:@"{ %0.3f, %0.3f, %0.3f }",
            self.plane.x,
            self.plane.y,
            self.plane.z];
    
}

- (MAVector)screenSpace {
    
    float X = self.plane.x*meter*0.5 + meter*0.5;
    float Y = self.plane.y*meter*screenRatio*0.5 + meter*screenRatio*0.5;
     
    return (MAVector){ X,Y };
    
}

- (CGRect)rectFromPlane {
    
    CGRect rectAsLine;
    float _width = 5;
    float _height = meter;
    
    float origX = self.plane.x;
    float origY = self.plane.y;
    
    float normalFromLeftEdge = dot( (MAVector){self.plane.x, self.plane.y}, (MAVector){0,1});
    origX = origX-normalFromLeftEdge*meter+self.plane.z;
    origY = origX-normalFromLeftEdge*meter+self.plane.z;
    
    rectAsLine = CGRectMake(origX, origY, _width, _height);
    
    return rectAsLine;
    
}

- (MALine)lineFromPlane {
    
    MALine line;
    
    float origX = self.plane.x;
    float origY = self.plane.y;
    
    float normalFromLeftEdge = dot( (MAVector){self.plane.x, self.plane.y}, (MAVector){1,0});
    
    origX = origX*meter*normalFromLeftEdge;
    origY = origY*meter;

    float endPointX = meter*normalFromLeftEdge*self.plane.x;
    float endPointY = meter*normalFromLeftEdge*self.plane.y;
    
    line = (MALine){origX, origY, endPointX, endPointY};
    
    return line;

    
}

- (double)angleBetween:(MAVector)v2 {
    
    MAVector v1 = {self.plane.x, self.plane.y};
    
    double normal = dot(v1,  v2);

    return normal;
}

- (double)angleToScreenCenter {
    
    CGPoint center = MARectGetCenter([[UIScreen mainScreen] bounds]);
    return [self angleBetween:CGPointToMAVector(center)];
        
}






            


@end
