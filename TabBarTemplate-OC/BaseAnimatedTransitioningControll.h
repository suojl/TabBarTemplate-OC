//
//  BaseAnimatedTransitioningControll.h
//  TabBarTemplate-OC
//
//  Created by issuser on 16/7/18.
//
//

#import <Foundation/Foundation.h>

@interface BaseAnimatedTransitioningControll : NSObject<UIViewControllerAnimatedTransitioning>
/**
 The direction of the animation.
 */
@property (nonatomic, assign) BOOL reverse;

/**
 The animation duration.
 */
@property (nonatomic, assign) NSTimeInterval duration;

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext fromVC:(UIViewController *)fromVC toVC:(UIViewController *)toVC;
@end
