//
//  TestVCAnimatedTransitionController.m
//  TabBarTemplate-OC
//
//  Created by issuser on 16/7/20.
//  Copyright © 2016年 suojl. All rights reserved.
//

#import "TestVCAnimatedTransitionController.h"
#import "TestViewController.h"

@implementation TestVCAnimatedTransitionController


- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext fromVC:(UIViewController *)fromVC toVC:(UIViewController *)toVC fromView:(UIView *)fromView toView:(UIView *)toView{
    TestViewController* toViewController = (TestViewController *)toVC;
    // 展现动画的容器视图
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    if (!self.reverse) {
        
        CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
        toView.frame = finalFrame;
        toView.alpha = 0;
//        toView.hidden = YES;
        [containerView addSubview:toView];
        
        [toView snapshotViewAfterScreenUpdates:YES];
        
        // 添加TopView到容器视图
        UIView* topView = toViewController.topView;
        UIView* topViewSnapshot = [topView snapshotViewAfterScreenUpdates:NO];
        topViewSnapshot.frame = CGRectOffset(topView.frame, 0, -topView.frame.size.height);
        [containerView addSubview:topViewSnapshot];
        topView.hidden = YES;
        
        // 添加bottomView到容器视图
        UIView* bottomView = toViewController.bottomView;
        UIView* bottomViewSnapshot = [bottomView snapshotViewAfterScreenUpdates:NO];
        bottomViewSnapshot.frame = CGRectOffset(bottomView.frame,0,bottomView.frame.size.height);
        [containerView addSubview:bottomViewSnapshot];
        bottomView.hidden = YES;
        
        [UIView animateWithDuration:duration
                              delay:0.0
             usingSpringWithDamping:1.0
              initialSpringVelocity:0.0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             fromView.alpha = 0;
                             topViewSnapshot.frame = topView.frame;
                             bottomViewSnapshot.frame = bottomView.frame;
                             toView.alpha = 1;
                         } completion:^(BOOL finished) {
                             // 5. Tell context that we completed.
//                             toView.hidden = NO;
                             topView.hidden = NO;
                             bottomView.hidden = NO;
                             fromView.alpha = 1;
                             [topViewSnapshot removeFromSuperview];
                             [bottomViewSnapshot removeFromSuperview];
                             [transitionContext completeTransition:YES];
                         }];
    }else{
        
        CGRect initFrame = [transitionContext initialFrameForViewController:fromVC];
        CGRect finalFrame = CGRectOffset(initFrame, 0, ScreenHeight);
        
        [containerView addSubview:fromVC.view];
        
        [UIView animateWithDuration:duration animations:^{
            fromVC.view.frame = finalFrame;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
        
    }
    
}
@end
