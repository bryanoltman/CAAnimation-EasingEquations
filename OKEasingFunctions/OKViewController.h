//
//  OKViewController.h
//  OKEasingFunctions
//
//  Created by Bryan Oltman on 12/18/12.
//  Copyright (c) 2012 Bryan Oltman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OKViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *animatedView;

- (IBAction)playButtonClicked:(id)sender;

@end
