//
//  MACollisionDetector.m
//  BouncyBalls
//
//  Created by Miles Alden on 8/23/12.
//  Copyright (c) 2012 MilesAlden. All rights reserved.
//

#import "MACollisionDetector.h"
#import "MADrawing.h"
#import "MAObject.h"
#import "MAUtils.h"
#import "MAPlane.h"
#import "MAConstants.h"
#import "MAPlaneManager.h"

@implementation MACollisionDetector


+ (void)checkPlaneCollisions: (MAObject *)object {
    
    
    for ( MAPlane *plane in [MAPlaneManager planeStore] ) {
        
        MAVector vect2 = {plane.plane.x, plane.plane.y};

        double normal = dot1(vect2,  addVectors1(object.center, object.radius) );
        
        float distance = normal + plane.plane.z;
        LogInfo(@"Distance: %f", distance);
        
        if (distance < 0 && dot(vect2, object.velocity) < 0 )
        {
            // collision response
            // R = V - (1+COR)*N*(V⋅N)
            
            
            // Calculate dot product
            float dotResult = dot(vect2, object.velocity);
            
            // 2*N 
            MAVector resultA = multiplyVectors(vect2, (1+object.COR));
            
            // ...*dotResult
            MAVector resultB = multiplyVectors(resultA, dotResult);
            
            // object.velocity -=
            object.velocity = subtractVectorByVector(object.velocity, resultB);
        }
    }
    
}





+ (void)checkScreenCollisions: (MAObject *)object {
    
    // Moving left
    if (object.center.x < -1 && object.velocity.x < 0)
    {
        MAVector newVelocity = object.velocity;
        newVelocity.x = -newVelocity.x;
        object.velocity = newVelocity;
    }
    
    // Moving down
    if (object.center.y > meter*screenRatio && object.velocity.y > 0)
    {
        MAVector newVelocity = object.velocity;
        newVelocity.y = -newVelocity.y;
        object.velocity = newVelocity;
    }
    
    // Moving right
    if (object.center.x > 1*meter && object.velocity.x > 0)
    {
        MAVector newVelocity = object.velocity;
        newVelocity.x = -newVelocity.x;
        object.velocity = newVelocity;
    }
    
    // Moving up
    if (object.center.y < -1 && object.velocity.y < 0)
    {
        MAVector newVelocity = object.velocity;
        newVelocity.y = -newVelocity.y;
        object.velocity = newVelocity;
    }
    
}


@end
