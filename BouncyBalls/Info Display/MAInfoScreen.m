//
//  MAInfoScreen.m
//  BouncyBalls
//
//  Created by Miles Alden on 1/28/13.
//  Copyright (c) 2013 MilesAlden. All rights reserved.
//

#import "MAInfoScreen.h"
#import "UIWindow+MainWindow.h"



@implementation MAInfoScreen

static MAInfoScreen *infoScreen;

+ (MAInfoScreen *)infoScreen
{
    if ( infoScreen == nil ) {
        infoScreen = [[MAInfoScreen alloc] initWithFrame:[[UIWindow mainWindow] bounds]];
        infoScreen.display = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, infoScreen.frame.size.width, infoScreen.frame.size.height/3)];
        infoScreen.display.textColor = [UIColor colorWithRed:150/255 green:91/255 blue:99/255 alpha:0.6];
        infoScreen.display.textAlignment = UITextAlignmentCenter;
        infoScreen.display.font = [UIFont fontWithName:@"Helvetica-Bold" size:32.0];
        infoScreen.display.center = infoScreen.center;
        [infoScreen addSubview:infoScreen.display];

        return infoScreen;
    }
    
    return infoScreen;
}

- (id)init {
    
    if ( self = [super init] ) {
        // Do stuff
    }
    
    return self;
}

+ (id)allocWithZone:(NSZone *)zone {
    @synchronized(self) {
        if (infoScreen == nil) {
            infoScreen = [super allocWithZone:zone];
            return infoScreen;  // assignment and return on first allocation
        }
    }
    return nil; // on subsequent allocation attempts return nil
    
}

- (id)copyWithZone:(NSZone *)zone{
    return self;
}




- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}



- (void)updateDisplay:(NSString *)value {
    
    self.display.text = value;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
