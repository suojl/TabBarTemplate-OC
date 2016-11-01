//
//  Login_AnimatedTransitioningControll.m
//  TabBarTemplate-OC
//
//  Created by issuser on 2016/10/18.
//  Copyright © 2016年 suojl. All rights reserved.
//

#import "Login_AnimatedTransitioningControll.h"

@implementation Login_AnimatedTransitioningControll

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext fromVC:(UIViewController *)fromVC toVC:(UIViewController *)toVC fromView:(UIView *)fromView toView:(UIView *)toView{
    
    // 展现动画的容器视图
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    if (self.reverse) {
        // 获取最终视图frame
        CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
        toView.frame = finalFrame; // 设置视图为最终frame,即自动布局完成后的状态
        
        [containerView addSubview:toView];
        toView.transform = CGAffineTransformMakeScale(0.25, 0.25);
        
        [UIView animateWithDuration:duration
                              delay:0.0
             usingSpringWithDamping:0.6
              initialSpringVelocity:0.0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             toView.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
                         } completion:^(BOOL finished) {
                             // 5. Tell context that we completed.
                             [transitionContext completeTransition:YES];
                         }];
    }else{
        
//        CGRect initFrame = [transitionContext initialFrameForViewController:fromVC];
//        CGRect finalFrame = CGRectOffset(initFrame, 0, ScreenHeight-50);
        
        [containerView addSubview:fromVC.view];
        
        [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            fromVC.view.transform = CGAffineTransformMakeScale(0.25, 0.25);
        } completion:^(BOOL finish){
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
        
    }
}
@end
