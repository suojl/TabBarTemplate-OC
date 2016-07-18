//
//  SimpleAnimatedControll.m
//  TabBarTemplate-OC
//
//  Created by issuser on 16/7/18.
//
//

#import "SimpleAnimatedControll.h"

@implementation SimpleAnimatedControll


- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext fromVC:(UIViewController *)fromVC toVC:(UIViewController *)toVC{
    // 展现动画的容器视图
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    if (!self.reverse) {
        
        CGRect finalFrame = toVC.view.frame;
        CGRect initFrame = CGRectOffset(finalFrame, 0, ScreenHeight);
        toVC.view.frame = initFrame;
        
        [containerView addSubview:toVC.view];
        [UIView animateWithDuration:duration
                              delay:0.0
             usingSpringWithDamping:0.6
              initialSpringVelocity:0.0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             toVC.view.frame = finalFrame;
                         } completion:^(BOOL finished) {
                             // 5. Tell context that we completed.
                             [transitionContext completeTransition:YES];
                         }];
    }else{
        CGRect initFrame= fromVC.view.frame;
        CGRect finalFrame = CGRectOffset(initFrame, 0, ScreenHeight);
        
        [containerView addSubview:fromVC.view];
        
        [UIView animateWithDuration:duration
                              delay:0.0
             usingSpringWithDamping:1.0
              initialSpringVelocity:0.0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             fromVC.view.frame = finalFrame;
                         } completion:^(BOOL finished) {
                             // 5. Tell context that we completed.
                             [transitionContext completeTransition:YES];
                         }];
    }
    
}
@end
