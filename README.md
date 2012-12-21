CAAnimation-EasingEquations
===========================

A category on `CAAnimation` that provides a number of easing equations to add some zazz to your app (with examples!)

## Why?
Because adding easing to animations makes them more realistic. UIKit provides a very limited set of easing functions, so I added a few more.

[Easings.net][0] provides some good examples and further explanation.

## To use
- Link your build target with `QuartzCore`
	- Select your project in Xcode's project navigator
	- Select your project's target
	- Navigate to "Build Phases"
	- In the "Link Binary with Libraries" section, click the '+' button
	- Select `QuartzCore` and click "Add"
- Add `CAAnimation+EasingEquations.h` and `CAAnimation+EasingEquations.m` to your project
- Enjoy!

Because this uses CoreAnimation, animations are applied to `CALayer` objects. For example, if we wanted a `UIView` to become completely transparent over the course of a second, the code to do that would look like this:

```
    [CAAnimation addAnimationToLayer:animatedView.layer
                         withKeyPath:@"opacity"
                            duration:1
                                  to:0
                      easingFunction:CAAnimationEasingFuctionEaseInBounce];
```

In this example, the bounce ease-in function would be used.

[0]: http://easings.net/