//
//  MAInfoScreen.h
//  BouncyBalls
//
//  Created by Miles Alden on 1/28/13.
//  Copyright (c) 2013 MilesAlden. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MAInfoScreen : UIView


@property UILabel *display;


+ (MAInfoScreen *)infoScreen;
- (void)updateDisplay:(NSString *)value;

@end
