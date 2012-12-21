//
//  CAAnimation+EasingEquations.h
//  OKEasingFunctions
//
//  Created by Bryan Oltman on 12/18/12.
//  Copyright (c) 2012 Bryan Oltman. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

typedef NS_ENUM(NSInteger, CAAnimationEasingFuction) {
    CAAnimationEasingFuctionEaseInQuad,
    CAAnimationEasingFuctionEaseOutQuad,
    CAAnimationEasingFuctionEaseInOutQuad,
    
    CAAnimationEasingFuctionEaseInCubic,
    CAAnimationEasingFuctionEaseOutCubic,
    CAAnimationEasingFuctionEaseInOutCubic,
    
    CAAnimationEasingFuctionEaseInQuartic,
    CAAnimationEasingFuctionEaseOutQuartic,
    CAAnimationEasingFuctionEaseInOutQuartic,

    CAAnimationEasingFuctionEaseInQuintic,
    CAAnimationEasingFuctionEaseOutQuintic,
    CAAnimationEasingFuctionEaseInOutQuintic,

    CAAnimationEasingFuctionEaseInSine,
    CAAnimationEasingFuctionEaseOutSine,
    CAAnimationEasingFuctionEaseInOutSine,

    CAAnimationEasingFuctionEaseInExponential,
    CAAnimationEasingFuctionEaseOutExponential,
    CAAnimationEasingFuctionEaseInOutExponential,

    CAAnimationEasingFuctionEaseInCircular,
    CAAnimationEasingFuctionEaseOutCircular,
    CAAnimationEasingFuctionEaseInOutCircular,

    CAAnimationEasingFuctionEaseInElastic,
    CAAnimationEasingFuctionEaseOutElastic,
    CAAnimationEasingFuctionEaseInOutElastic,
    
    CAAnimationEasingFuctionEaseInBack,
    CAAnimationEasingFuctionEaseOutBack,
    CAAnimationEasingFuctionEaseInOutBack,

    CAAnimationEasingFuctionEaseInBounce,
    CAAnimationEasingFuctionEaseOutBounce,
    CAAnimationEasingFuctionEaseInOutBounce
};

@interface CAAnimation (EasingEquations)
+ (CAKeyframeAnimation*)animationWithKeyPath:(NSString *)keyPath
                                    duration:(CGFloat)duration
                                        from:(CGFloat)startValue
                                          to:(CGFloat)endValue
                              easingFunction:(CAAnimationEasingFuction)easingFunction;

+ (void)addAnimationToLayer:(CALayer *)layer
                withKeyPath:(NSString *)keyPath
                   duration:(CGFloat)duration
                       from:(CGFloat)startValue
                         to:(CGFloat)endValue
             easingFunction:(CAAnimationEasingFuction)easingFunction;
@end
