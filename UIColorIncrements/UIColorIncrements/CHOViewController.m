//
//  CHOViewController.m
//  UIColorIncrements
//
//  Created by Colin on 3/16/14.
//  Copyright (c) 2014 Colin Jackson. All rights reserved.
//

#import "CHOViewController.h"
#import "UIColor+Increments.h"
#import "UIView+Borders.h"

@interface CHOViewController ()

- (void)resetSteppers;
- (void)setupEventHandling;
- (void)setupUI;

@end

@implementation CHOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupUI];
    [self setupEventHandling];
}


#pragma mark - Event Handling methods
- (void)stepperValueChanged:(id)sender;
{
    if (![sender isKindOfClass:[UIStepper class]]) return;
    UIStepper *stepper = (UIStepper *)sender;
    
    if (![@[self.attribute1Stepper, self.attribute2Stepper, self.attribute3Stepper] containsObject:stepper]) return;
    
    UILabel *counterLabel;
    if ([stepper isEqual:self.attribute1Stepper]) counterLabel = self.attribute1CounterLabel;
    else if ([stepper isEqual:self.attribute2Stepper]) counterLabel = self.attribute2CounterLabel;
    else if ([stepper isEqual:self.attribute3Stepper]) counterLabel = self.attribute3CounterLabel;
    
    NSString *counterLabelString = [NSString stringWithFormat:@"%.2f", stepper.value];
    if ([counterLabelString isEqualToString:@"-0.00"]) counterLabelString = @"0.00";
    counterLabel.text = counterLabelString;
}

- (IBAction)submitAction:(id)sender
{
    CGFloat attribute1, attribute2, attribute3;
    
    attribute1 = self.attribute1Stepper.value;
    attribute2 = self.attribute2Stepper.value;
    attribute3 = self.attribute3Stepper.value;
    
    if (self.isRGB) {
        self.view.backgroundColor = [self.view.backgroundColor cho_colorWithChangeToRed:attribute1 green:attribute2 blue:attribute3];
    } else {
        self.view.backgroundColor = [self.view.backgroundColor cho_colorWithChangeToHue:attribute1 saturation:attribute2 brightness:attribute3];
    }
    
    [self resetSteppers];
}

- (IBAction)colorspaceSwitchAction:(id)sender
{
    [self resetSteppers];
    
    self.rgb = !self.rgb;
    if (self.isRGB) {
        self.attribute1Label.text = @"Red";
        self.attribute2Label.text = @"Green";
        self.attribute3Label.text = @"Blue";
        [self.colorspaceSwitchButton setTitle:@"HSB" forState:UIControlStateNormal];
    } else {
        self.attribute1Label.text = @"Hue";
        self.attribute2Label.text = @"Saturation";
        self.attribute3Label.text = @"Brightness";
        [self.colorspaceSwitchButton setTitle:@"RGB" forState:UIControlStateNormal];
    }
}

#pragma mark - Private methods
- (void)resetSteppers
{
    NSArray *steppersArray = @[self.attribute1Stepper, self.attribute2Stepper, self.attribute3Stepper];
    for (UIStepper *stepper in steppersArray) {
        stepper.value = 0.0;
        [stepper sendAction:@selector(stepperValueChanged:) to:self forEvent:nil];
    }
}

#pragma mark viewDidLoad setup methods
- (void)setupUI;
{
    [self.overlayView setRoundedBordersRadius:7.0f borderColor:[UIColor colorWithWhite:1.0f alpha:0.5f] borderWidth:1.0f];
    
    NSArray *buttonsArray = @[self.submitButton, self.colorspaceSwitchButton];
    for (UIButton *button in buttonsArray) {
        [button setRoundedBordersRadius:3.0f borderColor:[UIColor colorWithWhite:1.0f alpha:0.5f] borderWidth:1.0f];
    }
}

- (void)setupEventHandling
{
    self.rgb = NO;
    
    NSArray *stepperArray = @[self.attribute1Stepper, self.attribute2Stepper, self.attribute3Stepper];
    for (UIStepper *stepper in stepperArray) {
        
        [stepper addTarget:self action:@selector(stepperValueChanged:) forControlEvents:UIControlEventValueChanged];
    }
}

@end
