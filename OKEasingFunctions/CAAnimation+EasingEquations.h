//
//  CAAnimation+EasingEquations.h
//  OKEasingFunctions
//
//  Created by Bryan Oltman on 12/18/12.
//  Copyright (c) 2012 Bryan Oltman. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

typedef NS_ENUM(NSInteger, CAAnimationEasingFuction) {
    CAAnimationEasingFuctionEaseOutElastic,
    CAAnimationEasingFuctionEaseOutBounce
};

@interface CAAnimation (EasingEquations)
+ (CAKeyframeAnimation*)animationWithKeyPath:(NSString*)keyPath duration:(CGFloat)duration from:(CGFloat)startValue to:(CGFloat)endValue easingFunction:(CAAnimationEasingFuction)easingFunction;
@end
