//
//  NILViewController.h
//  TransformAnimations
//
//  Created by Bryan Oltman on 5/24/13.
//  Copyright (c) 2013 Bryan Oltman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NILViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *leftTableView;
@property (weak, nonatomic) IBOutlet UIView *rightTableView;

@end
