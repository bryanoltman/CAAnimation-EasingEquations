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
    
    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                     action:@selector(viewSwiped:)];
    recognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.leftTableView addGestureRecognizer:recognizer];
    
    recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                           action:@selector(viewSwiped:)];
    recognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self.rightTableView addGestureRecognizer:recognizer];
    
    self.rightTableView.frame = CGRectOffset(self.rightTableView.frame, self.view.frame.size.width, 0);
}

- (void)viewSwiped:(UISwipeGestureRecognizer *)sender
{
    CAAnimationEasingFunction f = CAAnimationEasingFunctionEaseOutElastic;
    CGFloat d = 1;
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft &&
        sender.view == self.leftTableView) {
        CATransform3D tr;
        
        // An example of how to "stack" transforms
        tr = CATransform3DMakeScale(2.5, 2.5, 1.0);
        tr = CATransform3DTranslate(tr, 95, 0, 0);
        [CAAnimation addAnimationToLayer:self.leftTableView.layer
                                duration:d
                             transform:tr
//                             transform:CATransform3DMakeRotation(250, 0, 0, 1)
//                               transform:CATransform3DMakeTranslation(-self.view.bounds.size.width, 0, 0)
                          easingFunction:f];
        [CAAnimation addAnimationToLayer:self.rightTableView.layer
                                duration:d
                               transform:CATransform3DMakeTranslation(-self.view.bounds.size.width, 0, 0)
                          easingFunction:f];
    }
    else if (sender.direction == UISwipeGestureRecognizerDirectionRight &&
             sender.view == self.rightTableView) {
        [CAAnimation addAnimationToLayer:self.leftTableView.layer
                                duration:d
                               transform:CATransform3DIdentity
                          easingFunction:f];
        [CAAnimation addAnimationToLayer:self.rightTableView.layer
                                duration:d
                               transform:CATransform3DIdentity
                          easingFunction:f];
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
