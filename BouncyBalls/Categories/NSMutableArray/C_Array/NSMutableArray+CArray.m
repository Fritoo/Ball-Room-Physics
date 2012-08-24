//
//  NSMutableArray+CArray.m
//  BouncyBalls
//
//  Created by Miles Alden on 8/23/12.
//  Copyright (c) 2012 MilesAlden. All rights reserved.
//

#import "NSMutableArray+CArray.h"
#import "Structs.h"

@implementation NSMutableArray (CArray)

+ (NSMutableArray *)arrayWithCArray: (void*)pointer primitiveType:(NSString *)type {

    NSMutableArray *array = @[];
    
    if ( [type isEqualToString:@"int"] ) {
        
    } else if ( [type isEqualToString:@"int"] ) {
        
    } else if ( [type isEqualToString:@"float"] ) {
        
    } else if ( [type isEqualToString:@"double"] ) {
        
    } else if ( [type isEqualToString:@"char"] ) {
        
    } else if ( [type isEqualToString:@"MAVector3"] ) {
        
    } else if ( [type isEqualToString:@"MAVector"] ) {
        
    } else if ( [type isEqualToString:@"int"] ) {
        
    } else if ( [type isEqualToString:@"int"] ) {
        
    } else if ( [type isEqualToString:@"int"] ) {
        
    } else if ( [type isEqualToString:@"int"] ) {
        
    } else return nil;
 
    return array;
    
}




@end
