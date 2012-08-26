//
//  MAPlane.m
//  BouncyBalls
//
//  Created by Miles Alden on 8/23/12.
//  Copyright (c) 2012 MilesAlden. All rights reserved.
//

#import "MAPlane.h"

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
    // { 1, 2, 0 }
    return [NSString stringWithFormat:@"{ %0.3f, %0.3f, %0.3f }",
            self.plane.x,
            self.plane.y,
            self.plane.z];
    
}

@end
