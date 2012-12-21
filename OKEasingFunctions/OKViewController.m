//
//  OKViewController.m
//  OKEasingFunctions
//
//  Created by Bryan Oltman on 12/18/12.
//  Copyright (c) 2012 Bryan Oltman. All rights reserved.
//

#import "OKViewController.h"
#import "CAAnimation+EasingEquations.h"

@implementation OKViewController

#pragma mark - IBActions
- (void)playButtonClicked:(id)sender
{
    // Resettin' thangs
    CGRect frame = self.animatedView.frame;
    frame.origin.x = 20;
    self.animatedView.frame = frame;
    
    [CAAnimation addAnimationToLayer:self.animatedView.layer
                         withKeyPath:@"position.x"
                            duration:1
                                  to:250
                      easingFunction:CAAnimationEasingFuctionEaseInBounce];
}

#pragma mark - UIPickerViewDataSource/Delegate
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 0;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 0;
}

@end
