//
//  UIView+EasingEquations.m
//  Bouncy Tables
//
//  Created by Bryan Oltman on 5/24/13.
//  Copyright (c) 2013 Bryan Oltman. All rights reserved.
//

#import "NSObject+EasingEquations.h"
#import "CAAnimation+EasingEquations.h"

@implementation NSObject (EasingEquations)

- (void)addAnimationToView:(UIView *)view
                   duration:(CGFloat)duration
                  transform:(CATransform3D)transform
             easingFunction:(CAAnimationEasingFunction)easingFunction
{
    [CAAnimation addAnimationToLayer:view.layer
                            duration:duration
                           transform:transform
                      easingFunction:easingFunction];
    [self performBlock:^{
        view.layer.transform = transform;
    } afterDelay:duration];
}


@end
