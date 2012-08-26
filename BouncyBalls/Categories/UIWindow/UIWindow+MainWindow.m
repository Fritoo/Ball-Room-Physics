//
//  UIWindow+MainWindow.m
//  BouncyBalls
//
//  Created by Miles Alden on 8/25/12.
//  Copyright (c) 2012 MilesAlden. All rights reserved.
//

#import "UIWindow+MainWindow.h"

@implementation UIWindow (MainWindow)


+ (UIWindow *)mainWindow {
    
    // Easy way to get the main window.
    // Usually only one window in an iOS app.
    return [[UIApplication sharedApplication] keyWindow];
}

+ (UIViewController *)rootViewController {
    
    // Easy way to get the main window's
    // root view controller.
    return [[UIWindow mainWindow] rootViewController];
}

@end
