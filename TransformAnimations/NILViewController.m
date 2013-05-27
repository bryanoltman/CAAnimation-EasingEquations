//
//  NILViewController.m
//  TransformAnimations
//
//  Created by Bryan Oltman on 5/24/13.
//  Copyright (c) 2013 Bryan Oltman. All rights reserved.
//

#import "NILViewController.h"

@implementation NILViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UISwipeGestureRecognizer *recognizer =
    [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                              action:@selector(viewSwiped:)];
    
    recognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.leftTableView addGestureRecognizer:recognizer];
    
    recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(viewSwiped:)];
    recognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self.leftTableView addGestureRecognizer:recognizer];
    
    self.rightTableView.frame = CGRectOffset(self.rightTableView.frame, self.view.frame.size.width, 0);
}

- (void)viewSwiped:(UISwipeGestureRecognizer *)sender
{
    CAAnimationEasingFunction f = CAAnimationEasingFunctionEaseOutBounce;
    CGFloat d = 0.33;
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft &&
        sender.view == self.leftTableView) {
        CATransform3D tr;
        tr = CATransform3DMakeScale(2.5, 2.5, 1.0);
        tr = CATransform3DTranslate(tr, 95, 0, 0);
        [self addAnimationToView:self.leftTableView
                        duration:d
                       transform:tr
//                     transform:CATransform3DMakeRotation(250, 0, 0, 1)
//                     transform:CATransform3DMakeTranslation(10, 0, 200)
                  easingFunction:f];
        [CAAnimation addAnimationToLayer:self.leftTableView.layer withKeyPath:@"opacity" duration:d to:1 easingFunction:f];
    }
    else if (sender.direction == UISwipeGestureRecognizerDirectionRight){
        [self addAnimationToView:self.leftTableView
                        duration:d
                       transform:CATransform3DIdentity
                  easingFunction:f];
        [CAAnimation addAnimationToLayer:self.leftTableView.layer withKeyPath:@"opacity" duration:d to:0.5 easingFunction:f];
    }
}

#pragma mark - Table View
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 150;
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)aIndexPath
{
    static NSString *reuseId = @"reuseId";
    UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:reuseId];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:reuseId];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"This is row %d", aIndexPath.row];
    
    return cell;
}

@end
