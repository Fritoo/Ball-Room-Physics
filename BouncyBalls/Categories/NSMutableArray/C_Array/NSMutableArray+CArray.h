//
//  NSMutableArray+CArray.h
//  BouncyBalls
//
//  Created by Miles Alden on 8/23/12.
//  Copyright (c) 2012 MilesAlden. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (CArray)

+ (NSMutableArray *)arrayWithCArray: (void*)pointer primitiveType:(NSString *)type;

@end
