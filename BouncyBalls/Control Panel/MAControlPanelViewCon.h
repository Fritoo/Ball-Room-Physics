//
//  MAControlPanelViewCon.h
//  PhysicsTester
//
//  Created by Miles Alden on 7/25/12.
//  Copyright (c) 2012 Milk Drinking Cow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MAControlPanelViewCon : UIViewController

@property int onScreen;
@property float lastSliderValue;
@property (strong) IBOutlet UISlider *planeSlider;
@property (strong) IBOutlet UILabel *label0;
@property (strong) IBOutlet UILabel *label1;
@property (strong) IBOutlet UILabel *label2;
@property (strong) IBOutlet UILabel *label3;


- (IBAction)dismissControlPanel:(id)sender;
- (IBAction)planeSliderChanged:(id)sender;
- (IBAction)velocityBurstPressed:(id)sender;
- (void)getReady;

@end
