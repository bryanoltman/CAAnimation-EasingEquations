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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.easingFunctionNames = @[
                                     @"Linear",
                                     @"EaseInQuad",
                                     @"EaseOutQuad",
                                     @"EaseInOutQuad",
                                     @"EaseInCubic",
                                     @"EaseOutCubic",
                                     @"EaseInOutCubic",
                                     @"EaseInQuartic",
                                     @"EaseOutQuartic",
                                     @"EaseInOutQuartic",
                                     @"EaseInQuintic",
                                     @"EaseOutQuintic",
                                     @"EaseInOutQuintic",
                                     @"EaseInSine",
                                     @"EaseOutSine",
                                     @"EaseInOutSine",
                                     @"EaseInExponential",
                                     @"EaseOutExponential",
                                     @"EaseInOutExponential",
                                     @"EaseInCircular",
                                     @"EaseOutCircular",
                                     @"EaseInOutCircular",
                                     @"EaseInElastic",
                                     @"EaseOutElastic",
                                     @"EaseInOutElastic",
                                     @"EaseInBack",
                                     @"EaseOutBack",
                                     @"EaseInOutBack",
                                     @"EaseInBounce",
                                     @"EaseOutBounce",
                                     @"EaseInOutBounce"
                                     ];
    }
    
    return self;
}

#pragma mark - IBActions
- (void)playButtonClicked:(id)sender
{
    // Resettin' thangs
    CGRect frame = self.animatedView.frame;
    frame.origin.x = 20;
    self.animatedView.frame = frame;
    
    CAAnimationEasingFunction selectedEasingFunction = (CAAnimationEasingFunction)[self.pickerView selectedRowInComponent:0];
    
    [CAAnimation addAnimationToLayer:self.animatedView.layer
                         withKeyPath:@"position.x"
                            duration:1
                                  to:250
                      easingFunction:selectedEasingFunction];
}

#pragma mark - UIPickerViewDataSource/Delegate
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.easingFunctionNames objectAtIndex:row];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.easingFunctionNames.count;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

@end
