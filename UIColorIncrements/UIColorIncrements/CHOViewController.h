//
//  CHOViewController.h
//  UIColorIncrements
//
//  Created by Colin on 3/16/14.
//  Copyright (c) 2014 Colin Jackson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHOViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *overlayView;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (weak, nonatomic) IBOutlet UIButton *colorspaceSwitchButton;

@property (weak, nonatomic) IBOutlet UILabel *attribute1Label;
@property (weak, nonatomic) IBOutlet UILabel *attribute2Label;
@property (weak, nonatomic) IBOutlet UILabel *attribute3Label;

@property (weak, nonatomic) IBOutlet UILabel *attribute1CounterLabel;
@property (weak, nonatomic) IBOutlet UILabel *attribute2CounterLabel;
@property (weak, nonatomic) IBOutlet UILabel *attribute3CounterLabel;

@property (weak, nonatomic) IBOutlet UIStepper *attribute1Stepper;
@property (weak, nonatomic) IBOutlet UIStepper *attribute2Stepper;
@property (weak, nonatomic) IBOutlet UIStepper *attribute3Stepper;

@property (getter = isRGB) BOOL rgb;

- (void)stepperValueChanged:(id)sender;

- (IBAction)submitAction:(id)sender;
- (IBAction)colorspaceSwitchAction:(id)sender;

@end
