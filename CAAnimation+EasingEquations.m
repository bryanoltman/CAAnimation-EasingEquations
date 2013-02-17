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

///////////// QUADRATIC EASING: t^2 ///////////////////
static EasingFunction easeInQuad = ^CGFloat(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    return c * (t /= d) * t + b;
};

static EasingFunction easeOutQuad = ^CGFloat(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    return -c * (t /= d) * (t - 2) + b;
};

static EasingFunction easeInOutQuad = ^CGFloat(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
	if ((t/=d/2) < 1) return c/2*t*t + b;
	return -c/2 * ((--t)*(t-2) - 1) + b;
};

///////////// CUBIC EASING: t^3 ///////////////////////
static EasingFunction easeInCubic = ^CGFloat(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    return c*(t/=d)*t*t + b;
};

static EasingFunction easeOutCubic = ^CGFloat(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    return c*((t=t/d-1)*t*t + 1) + b;
};

static EasingFunction easeInOutCubic = ^CGFloat(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
	if ((t/=d/2) < 1) return c/2*t*t*t + b;
	return c/2*((t-=2)*t*t + 2) + b;
};

///////////// QUARTIC EASING: t^4 /////////////////////
static EasingFunction easeInQuart = ^CGFloat(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    return c*(t/=d)*t*t*t + b;
};

static EasingFunction easeOutQuart = ^CGFloat(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    return -c * ((t=t/d-1)*t*t*t - 1) + b;
};

static EasingFunction easeInOutQuart = ^CGFloat(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
	if ((t/=d/2) < 1) return c/2*t*t*t*t + b;
	return -c/2 * ((t-=2)*t*t*t - 2) + b;
};

///////////// QUINTIC EASING: t^5  ////////////////////
static EasingFunction easeOutQuint = ^CGFloat(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    return c*(t/=d)*t*t*t*t + b;
};

static EasingFunction easeInQuint = ^CGFloat(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    return c*((t=t/d-1)*t*t*t*t + 1) + b;
};

static EasingFunction easeInOutQuint = ^CGFloat(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
	if ((t/=d/2) < 1) return c/2*t*t*t*t*t + b;
	return c/2*((t-=2)*t*t*t*t + 2) + b;
};

///////////// SINUSOIDAL EASING: sin(t) ///////////////
static EasingFunction easeInSine = ^CGFloat(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    return -c * cos(t/d * (M_PI/2)) + c + b;
};

static EasingFunction easeOutSine = ^CGFloat(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    return c * sin(t/d * (M_PI/2)) + b;
};

static EasingFunction easeInOutSine = ^CGFloat(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    return -c/2 * (cos(M_PI*t/d) - 1) + b;
};

///////////// EXPONENTIAL EASING: 2^t /////////////////
static EasingFunction easeInExpo = ^CGFloat(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
	return (t==0) ? b : c * pow(2, 10 * (t/d - 1)) + b;
};

static EasingFunction easeOutExpo = ^CGFloat(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
	return (t==d) ? b+c : c * (-pow(2, -10 * t/d) + 1) + b;
};

static EasingFunction easeInOutExpo = ^CGFloat(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
	if (t==0) return b;
	if (t==d) return b+c;
	if ((t/=d/2) < 1) return c/2 * pow(2, 10 * (t - 1)) + b;
	return c/2 * (-pow(2, -10 * --t) + 2) + b;
};

/////////// CIRCULAR EASING: sqrt(1-t^2) //////////////
static EasingFunction easeInCirc = ^CGFloat(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
	return -c * (sqrt(1 - (t/=d)*t) - 1) + b;
};

static EasingFunction easeOutCirc = ^CGFloat(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
	return c * sqrt(1 - (t=t/d-1)*t) + b;
};

static EasingFunction easeInOutCirc = ^CGFloat(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
	if ((t/=d/2) < 1) return -c/2 * (sqrt(1 - t*t) - 1) + b;
	return c/2 * (sqrt(1 - (t-=2)*t) + 1) + b;
};

/////////// ELASTIC EASING: exponentially decaying sine wave  //////////////
static EasingFunction easeInElastic = ^CGFloat(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    CGFloat amplitude = 5;
    CGFloat period = 0.3;
    CGFloat s = 0;

	if (t==0) return b;
    
    if ((t/=d)==1) return b+c;
    
    if (!period) {
        period = d * .3;
    }
    
	if (amplitude < abs(c)) {
        amplitude = c;
        s = period / 4;
    }
	else {
        s = period/(2*M_PI) * asin (c/amplitude);
    }
	
    return -(amplitude*pow(2,10*(t-=1)) * sin( (t*d-s)*(2*M_PI)/period )) + b;
};

static EasingFunction easeOutElastic = ^CGFloat(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    CGFloat amplitude = 5;
    CGFloat period = 0.3;
    CGFloat s = 0;
    if (t == 0) {
        return b;
    }
    else if ((t /= d) == 1) {
        return b + c;
    }
    
    if (!period) {
        period = d * .3;
    }
    
    if (amplitude < abs(c)) {
        amplitude = c;
        s = period / 4;
    }
    else {
        s = period / (2 * M_PI) * sin(c / amplitude);
    }
    
    return (amplitude * pow(2, -10 * t) * sin((t * d - s) * (2 * M_PI) / period) + c + b);
};

static EasingFunction easeInOutElastic = ^CGFloat(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    CGFloat amplitude = 5;
    CGFloat period = 0.3;
    CGFloat s = 0;

	if (t==0) return b;
    
    if ((t /= d / 2) == 2) {
        return b + c;
    }
    
    if (!period) {
        period = d * (.3 * 1.5);
    }
    
	if (amplitude < abs(c)) {
        amplitude = c;
        s = period / 4;
    }
	else {
        s = period / (2 * M_PI) * asin (c / amplitude);
    }
    
	if (t < 1) return -.5*(amplitude*pow(2,10*(t-=1)) * sin( (t*d-s)*(2*M_PI)/period )) + b;
    
	return amplitude * pow(2,-10*(t-=1)) * sin( (t*d-s)*(2*M_PI)/period )*.5 + c + b;
};

///////////// BACK EASING: overshooting cubic easing: (s+1)*t^3 - s*t^2  //////////////
//// s controls the amount of overshoot: higher s means greater overshoot
//// s has a default value of 1.70158, which produces an overshoot of 10 percent
//// s==0 produces cubic easing with no overshoot
static EasingFunction easeInBack = ^CGFloat(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
	CGFloat s = 1.70158;
	return c*(t/=d)*t*((s+1)*t - s) + b;
};

static EasingFunction easeOutBack = ^CGFloat(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
	CGFloat s = 1.70158;
	return c*((t=t/d-1)*t*((s+1)*t + s) + 1) + b;
};

static EasingFunction easeInOutBack = ^CGFloat(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
	CGFloat s = 1.70158;
	if ((t/=d/2) < 1) return c/2*(t*t*(((s*=(1.525))+1)*t - s)) + b;
	return c/2*((t-=2)*t*(((s*=(1.525))+1)*t + s) + 2) + b;
};

///////////// BOUNCE EASING: exponentially decaying parabolic bounce  //////////////
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

static EasingFunction easeInBounce = ^CGFloat(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
	return c - easeOutBounce(d-t, 0, c, d) + b;
};

static EasingFunction easeInOutBounce = ^CGFloat(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
	if (t < d/2) return easeInBounce (t*2, 0, c, d) * .5 + b;
	return easeOutBounce (t*2-d, 0, c, d) * .5 + c*.5 + b;
};


@implementation CAAnimation (EasingEquations)

+ (EasingFunction)blockForCAAnimationEasingFunction:(CAAnimationEasingFunction)easingFunction
{
    static NSDictionary *easingFunctionsToBlocks = nil;
    if (!easingFunctionsToBlocks) {
        easingFunctionsToBlocks = @{
            @(CAAnimationEasingFunctionEaseInQuad) : easeInQuad,
            @(CAAnimationEasingFunctionEaseOutQuad) : easeOutQuad,
            @(CAAnimationEasingFunctionEaseInOutQuad) : easeInOutQuad,
            
            @(CAAnimationEasingFunctionEaseInCubic) : easeInCubic,
            @(CAAnimationEasingFunctionEaseOutCubic) : easeOutCubic,
            @(CAAnimationEasingFunctionEaseInOutCubic) : easeInOutCubic,
            
            @(CAAnimationEasingFunctionEaseInQuartic) : easeInQuart,
            @(CAAnimationEasingFunctionEaseOutQuartic) : easeOutQuart,
            @(CAAnimationEasingFunctionEaseInOutQuartic) : easeInOutQuart,
            
            @(CAAnimationEasingFunctionEaseInQuintic) : easeInQuint,
            @(CAAnimationEasingFunctionEaseOutQuintic) : easeOutQuint,
            @(CAAnimationEasingFunctionEaseInOutQuintic) : easeInOutQuint,
            
            @(CAAnimationEasingFunctionEaseInSine) : easeInSine,
            @(CAAnimationEasingFunctionEaseOutSine) : easeOutSine,
            @(CAAnimationEasingFunctionEaseInOutSine) : easeInOutSine,
            
            @(CAAnimationEasingFunctionEaseInExponential) : easeInExpo,
            @(CAAnimationEasingFunctionEaseOutExponential) : easeOutExpo,
            @(CAAnimationEasingFunctionEaseInOutExponential) : easeInOutExpo,
            
            @(CAAnimationEasingFunctionEaseInCircular) : easeInCirc,
            @(CAAnimationEasingFunctionEaseOutCircular) : easeOutCirc,
            @(CAAnimationEasingFunctionEaseInOutCircular) : easeInOutCirc,
            
            @(CAAnimationEasingFunctionEaseInElastic) : easeInElastic,
            @(CAAnimationEasingFunctionEaseOutElastic) : easeOutElastic,
            @(CAAnimationEasingFunctionEaseInOutElastic) : easeInOutElastic,
            
            @(CAAnimationEasingFunctionEaseInBack) : easeInBack,
            @(CAAnimationEasingFunctionEaseOutBack) : easeOutBack,
            @(CAAnimationEasingFunctionEaseInOutBack) : easeInOutBack,
            
            @(CAAnimationEasingFunctionEaseInBounce) : easeInBounce,
            @(CAAnimationEasingFunctionEaseOutBounce) : easeOutBounce,
            @(CAAnimationEasingFunctionEaseInOutBounce) : easeInOutBounce
        };
    }
    
    return [easingFunctionsToBlocks objectForKey:@(easingFunction)];
}

+ (CAKeyframeAnimation*)animationWithKeyPath:(NSString*)keyPath
                                    duration:(CGFloat)duration
                                        from:(CGFloat)startValue
                                          to:(CGFloat)endValue
                              easingFunction:(CAAnimationEasingFunction)easingFunction
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

+ (void)addAnimationToLayer:(CALayer *)layer
                withKeyPath:(NSString *)keyPath
                   duration:(CGFloat)duration
                         to:(CGFloat)endValue
             easingFunction:(CAAnimationEasingFunction)easingFunction
{
    CAAnimation *animation = [self animationWithKeyPath:keyPath
                                               duration:duration
                                                   from:[[layer valueForKeyPath:keyPath] floatValue]
                                                     to:endValue
                                         easingFunction:easingFunction];
    [layer addAnimation:animation forKey:nil];
}

+ (void)addAnimationToLayer:(CALayer *)layer
                withKeyPath:(NSString *)keyPath
                   duration:(CGFloat)duration
                       from:(CGFloat)startValue
                         to:(CGFloat)endValue
             easingFunction:(CAAnimationEasingFunction)easingFunction
{
    CAAnimation *animation = [self animationWithKeyPath:keyPath
                                               duration:duration
                                                   from:startValue
                                                     to:endValue
                                         easingFunction:easingFunction];
    [layer addAnimation:animation forKey:nil];
}

@end
