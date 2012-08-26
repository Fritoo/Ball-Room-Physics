//
//  MAStaticRootViewConViewController.m
//  BouncyBalls
//
//  Created by Miles Alden on 8/24/12.
//  Copyright (c) 2012 MilesAlden. All rights reserved.
//

#import "MAStaticRootViewCon.h"

@interface MAStaticRootViewCon ()

@end

@implementation MAStaticRootViewCon

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (BOOL)shouldAutorotate {
    
    return 0;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    
    return (UIInterfaceOrientationIsPortrait(toInterfaceOrientation));
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
