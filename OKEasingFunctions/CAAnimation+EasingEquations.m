//
//  CAAnimation+EasingEquations.m
//  OKEasingFunctions
//
//  Created by Bryan Oltman on 12/18/12.
//  Copyright (c) 2012 Bryan Oltman. All rights reserved.
//

#import "CAAnimation+EasingEquations.h"

// Thanks to http://www.dzone.com/snippets/robert-penner-easing-equations for the easing
// equation implementations
typedef CGFloat (^EasingFunction)(CGFloat, CGFloat, CGFloat, CGFloat);

static EasingFunction easeOutElastic = ^CGFloat(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    CGFloat a = 5;
    CGFloat p = 0.3;
    CGFloat s = 0;
    if (t == 0) {
        return b;
    }
    else if ((t /= d) == 1) {
        return b + c;
    }
    
    if (!p) {
        p = d * .3;
    }
    
    if (a < abs(c)) {
        a = c;
        s = p / 4;
    }
    else {
        s = p / (2 * M_PI) * sin(c / a);
    }
    
    return (a*pow(2, -10 * t) * sin((t * d - s) * (2 * M_PI) / p) + c + b);
};

static EasingFunction easeOutBounce = ^CGFloat(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    if ((t /= d) < (1 / 2.75)) {
        return c * (7.5625 * t * t) + b;
    }
    else if (t < (2 / 2.75)) {
        return c * (7.5625 * (t -= (1.5 / 2.75)) * t + 0.75) + b;
    }
    else if (t < (2.5 / 2.75)) {
        return c * (7.5625 * (t -= (2.25 / 2.75)) * t + 0.9375) + b;
    }
    else {
        return c * (7.5625 * (t -= (2.625 / 2.75)) * t + 0.984375) + b;
    }
};

@implementation CAAnimation (EasingEquations)

+ (EasingFunction)blockForCAAnimationEasingFunction:(CAAnimationEasingFuction)easingFunction
{
    static NSDictionary *easingFunctionsToBlocks = nil;
    if (!easingFunctionsToBlocks) {
        easingFunctionsToBlocks = @{
        @(CAAnimationEasingFuctionEaseOutBounce) : easeOutBounce,
        @(CAAnimationEasingFuctionEaseOutElastic) : easeOutElastic
        };
    }
    
    return [easingFunctionsToBlocks objectForKey:@(easingFunction)];
}

+ (CAKeyframeAnimation*)animationWithKeyPath:(NSString*)keyPath duration:(CGFloat)duration from:(CGFloat)startValue to:(CGFloat)endValue easingFunction:(CAAnimationEasingFuction)easingFunction
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:keyPath];
    animation.duration = duration;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.removedOnCompletion = NO;
    
    CGFloat steps = 100;
    NSMutableArray *values = [NSMutableArray arrayWithCapacity:steps];
    CGFloat delta = endValue - startValue;
    EasingFunction function = [CAAnimation blockForCAAnimationEasingFunction:easingFunction];
    for (CGFloat t = 0; t < steps; t++) {
        [values addObject:@(function(animation.duration * (t / steps), startValue, delta, animation.duration))];
    }
    
    animation.values = values;
    return animation;
}

@end
