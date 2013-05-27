//
//  UIView+EasingEquations.h
//  Bouncy Tables
//
//  Created by Bryan Oltman on 5/24/13.
//  Copyright (c) 2013 Bryan Oltman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CAAnimation+EasingEquations.h"
#import "NSObject+PerformBlockAfterDelay.h"

@interface NSObject (EasingEquations)

- (void)addAnimationToView:(UIView *)view
                   duration:(CGFloat)duration
                  transform:(CATransform3D)transform
             easingFunction:(CAAnimationEasingFunction)easingFunction;
@end
