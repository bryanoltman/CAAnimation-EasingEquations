//
//  OKViewController.h
//  OKEasingFunctions
//
//  Created by Bryan Oltman on 12/18/12.
//  Copyright (c) 2012 Bryan Oltman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OKViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) NSArray *easingFunctionNames;

@property (weak, nonatomic) IBOutlet UIView *animatedView;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

- (IBAction)playButtonClicked:(id)sender;

@end
