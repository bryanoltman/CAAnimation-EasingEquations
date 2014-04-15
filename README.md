CAAnimation-EasingEquations
===========================

A category on `CAAnimation` that provides a number of easing equations to add some zazz to your app (with examples!)

## Why?
Because adding easing to animations makes them more realistic. UIKit provides a very limited set of easing functions, so I added a few more.

[Easings.net][0] provides some good examples and further explanation.

## To use
Add `pod 'CAAnimation-EasingEquations'` to your podfile

#### Or
- Link your build target with `QuartzCore`
	- Select your project in Xcode's project navigator
	- Select your project's target
	- Navigate to "Build Phases"
	- In the "Link Binary with Libraries" section, click the '+' button
	- Select `QuartzCore` and click "Add"
- Add `CAAnimation+EasingEquations.h/m` to your project
- Enjoy!

### Animating layer properties with key paths
Because this uses CoreAnimation, animations are applied to `CALayer` objects. For example, if we wanted a `UIView` to become completely transparent over the course of a second, the code to do that would look like this:

```
    [CAAnimation addAnimationToLayer:animatedView.layer
                         withKeyPath:@"opacity"
                            duration:1
                                  to:0
                      easingFunction:CAAnimationEasingFuctionEaseInBounce];
```

In this example, the bounce ease-in function would be used.

### Animating layer transforms
Similarly to above, if we wanted to apply a transform to `animatedView`, we could do it like so:

```
    CATransform3D tr;
    tr = CATransform3DMakeScale(2.5, 2.5, 1.0);
    tr = CATransform3DTranslate(tr, 95, 0, 0);
    [CAAnimation addAnimationToLayer:animatedView.layer
                            duration:1
                           transform:tr
                      easingFunction:CAAnimationEasingFuctionEaseOutBack];
```

This would scale `animatedView` to 2.5x its current size and translate it 95px to the right over the course of 1 second.

## Examples

Two sample projets have been included to illustrate the use of this category. 

### OKEasingFunctions

This illustrates the different easing functions. This was written before the addition of CATransform3D animation functions, so all animations are performed with key paths.

### TransformAnimations

This illustrates the CATransform3D additions. There are two tables, each with a swipe gesture recognizer. Swipe, and they animate. It's magic!

## License

`CAAnimation+EasingEquations` is licensed under the MIT License. Please give me some kind of attribution if you use it in your project, such as a "thanks" note somewhere. I'd also love to know if you use my code, please drop me a line if you do! See the LICENSE file for full license text.

[0]: http://easings.net/
