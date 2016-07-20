//
//  BaseAnimatedTransitioningControll.m
//  TabBarTemplate-OC
//
//  Created by issuser on 16/7/18.
//
//

#import "BaseAnimatedTransitioningControll.h"

@implementation BaseAnimatedTransitioningControll


- (id)init {
    if (self = [super init]) {
        self.duration = 1.0f;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return self.duration;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    [self animateTransition:transitionContext fromVC:fromVC toVC:toVC fromView:fromVC.view toView:toVC.view];
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext fromVC:(UIViewController *)fromVC toVC:(UIViewController *)toVC fromView:(UIView *)fromView toView:(UIView *)toView{
    
}
@end
